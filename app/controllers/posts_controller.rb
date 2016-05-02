class PostsController < ApplicationController
  before_action :require_login
  respond_to :html, :js, :json

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    if remotipart_submitted?
      render :layout => false, :template => ('posts/create.js.erb'), :status => (@post.errors.any? ? :unprocessable_entity : :ok)
    else
      respond_with(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with(@post)
  end

  private

    def post_params
      params.require(:post).permit(:author_id, :content, :picture, :picture_cache)
    end
end