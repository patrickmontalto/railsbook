class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    #params[:post][:author_id] = current_user.id
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    # Need to build feed method
    @posts = current_user.feed
  end

  private

    def post_params
      params.require(:post).permit(:author_id, :content)
    end
end
