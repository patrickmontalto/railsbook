class Timeline
  include ActiveModel::Model

  def initialize(user)
    @user = user
  end

  def posts
    Post.where(author_id: post_user_ids).order('id DESC')
  end

  private

    def post_user_ids
      [@user.id] + @user.mutual_friends.ids
    end
end