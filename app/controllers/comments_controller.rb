class CommentsController < ApplicationController 
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment posted!"
      redirect_to root_url
    elsif params[:location] == "home"
      flash[:danger] = "Comment can't be blank."
      redirect_to root_path
    else
      flash[:danger] = "Comment can't be blank."
      redirect_to user_path(current_user)
      #@user = User.find(params[:post][:author_id])
      #render :template => 'users/show'
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:author_id, :post_id, :content)
    end
end
