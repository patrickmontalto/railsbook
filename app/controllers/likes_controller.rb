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
      redirect_to user_path(@post.author)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.unlike(@post)
      flash[:success] = "Unliked post!"
      if params[:location] == "home"
        redirect_to root_path
      else
        redirect_to user_path(@post.author)
      end
    elsif params[:location] == "home"
      flash[:danger] = "Can't unlike post."
      redirect_to root_url
    else
      flash[:danger] = "Can't unlike post."
      redirect_to user_path(@post.author)
    end
  end
  
end
