module LikesHelper
  def post_like_commands(current_user, post)
    if current_user.like?(post)
      render partial:'posts/like_commands_liked', locals: {post: post }
    else
      render partial:'posts/like_commands_unliked', locals: {post: post }
    end
  end
end
