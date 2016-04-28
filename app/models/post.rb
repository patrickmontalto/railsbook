class Post < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :author, :class_name => "User"
  has_many :likes
  has_many :comments
  validates :author, presence: true
  validates :content, presence: true
  validate :picture_size
  
  def likes_count
    ActionController::Base.helpers.pluralize(likes.count, 'Like')
  end

  def comments_count
    ActionController::Base.helpers.pluralize(comments.count, 'Comment')
  end

  private

    # Validate the size of an uploaded picture
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
