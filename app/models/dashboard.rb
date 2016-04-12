class Dashboard

  def initialize(user)
    @user = user
  end

  def new_post
    Post.new
  end

  def new_comment
    Comment.new
  end

  def users
    User.all
  end

  def timeline
    Timeline.new(@user)
  end

end