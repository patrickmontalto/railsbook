class Post < ActiveRecord::Base
  validates :author, presence: true
  validates :content, presence: true
  belongs_to :author, :class_name => "User"
  has_many :likes
  has_many :comments
end
