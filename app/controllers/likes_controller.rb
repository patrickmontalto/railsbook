class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post])
    if current_user.like(@post)
      flash[:success] = "Liked post!"
      if params[:location] == "home"
        redirect_to root_path
      else
        redirect_to user_path(@post.author)
      end
    elsif params[:location] == "home"
      flash[:danger] = "Unable to like post."
      redirect_to root_url
    else
      flash[:danger] = "Unable to like post."
      redirect_to user_path(current_user)
    end
  end

  def destroy
  end
end
