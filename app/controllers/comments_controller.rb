class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post])
  end

  def destroy
  end

  private

    def comment_params
      params.permit(:comment).require(:author, :post, :content)
    end
end
