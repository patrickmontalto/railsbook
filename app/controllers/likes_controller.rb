class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post])
    if current_user.like(@post)
      flash[:success] = "Liked post!"
      redirect_to :back
    else
      flash[:danger] = "Unable to like post."
      redirect_to :back
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.unlike(@post)
      flash[:success] = "Unliked post."
      redirect_to :back
    else
      flash[:danger] = "Can't unlike post."
      redirect_to :back
    end
  end
  
end
