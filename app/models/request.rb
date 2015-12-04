class Request < ActiveRecord::Base
  before_save :build_relationship
  validates :sender_id, presence: true
  validates :recipient_id, presence: true

  belongs_to :sender, :class_name => "User"
  belongs_to :recipient, :class_name => "User"
  
  private
    def build_relationship
        Relationship.create!(user_id: self.recipient_id, friend_id: self.sender_id) if self.accepted == true
    end
end
