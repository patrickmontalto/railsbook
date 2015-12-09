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
    elsif request.env['PATH_INFO'] == "/"
      render 'static_pages/index'
    else
      flash[:danger] = "Content can't be blank."
      redirect_to user_path(current_user)
      #@user = User.find(params[:post][:author_id])
      #render :template => 'users/show'
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
