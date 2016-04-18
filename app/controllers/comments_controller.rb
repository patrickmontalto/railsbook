class CommentsController < ApplicationController 
  before_action :require_login
  respond_to :html, :js, :json

  def create
    @comment = Comment.new(comment_params)
    post = Post.find(params[:comment][:post_id])
    @comment.save
    respond_with(@comment)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_with(@comment)
  end

  private

    def comment_params
      params.require(:comment).permit(:author_id, :post_id, :content)
    end
end
