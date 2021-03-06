class Comment < ActiveRecord::Base
  validates :content, presence: true
  validates :author, presence: true
  validates :post, presence: true
  belongs_to :post
  belongs_to :author, :class_name => "User"
end
