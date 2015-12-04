class Relationship < ActiveRecord::Base
  # there can only be one record per relationship direction. i.e. '1' can't be friends with '3' twice or more
  validates_uniqueness_of :friend_id, scope: [:user_id]
  
  belongs_to :user, dependent: :destroy
  belongs_to :friend, :class_name => "User", dependent: :destroy
end
