class UsersController < ApplicationController
	before_action :require_login
	def show
    @post = Post.new
    @comment = Comment.new
		@user = User.find(params[:id])
	end
end
