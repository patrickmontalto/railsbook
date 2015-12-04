class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # ActiveRecord relations
  has_many :authored_posts, :class_name => "Post", :foreign_key => "author_id", dependent: :destroy

  has_many :sent_requests, :class_name => "Request", :foreign_key => "sender_id"
  has_many :received_requests, :class_name => "Request", :foreign_key => "recipient_id"
  #has_many :active_relationships, :class_name => "Relationship"
  #has_many :forward_friends, :through => :active_relationships, :source => :friend
  #has_many :passive_relationships, :class_name => "Relationship", :foreign_key => "friend_id"
  #has_many :reverse_friends, :through => :passive_relationships, :source => :user

  has_many :relationships
  has_many :friends, :through => :relationships, source: :relationship
  has_many :friended_by, class_name: "Relationship", :foreign_key => "friend_id"
  has_many :friended_by_users, :through => :friended_by, source: :user

  def mutual_friends
    friended_by.where('user_id in (?)', friend_user_ids)
  end

  # user.accept_request(request) will update to true and then build the relationship if it doesn't exist
  def accept_request(request)
    request.update_attributes(accepted: true)
  end
    
end
