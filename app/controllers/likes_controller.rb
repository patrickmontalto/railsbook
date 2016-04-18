class LikesController < ApplicationController
  respond_to :js, :json, :html

  def create
    @post = Post.find(params[:id])
    if current_user.like(@post)
      render json: { count: @post.likes_count, id: params[:id] }
    else
      flash[:danger] = "Unable to like post."
      redirect_to :back
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.unlike(@post)
      render json: { count: @post.likes_count, id: params[:id] }
    else
      flash[:danger] = "Can't unlike post."
      redirect_to :back
    end
  end
  
end
