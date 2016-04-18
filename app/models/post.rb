class Post < ActiveRecord::Base
  validates :author, presence: true
  validates :content, presence: true
  belongs_to :author, :class_name => "User"
  has_many :likes
  has_many :comments

  def likes_count
    ActionController::Base.helpers.pluralize(likes.count, 'Like')
  end

  def comments_count
    ActionController::Base.helpers.pluralize(comments.count, 'Comment')
  end
end
