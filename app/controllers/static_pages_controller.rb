class StaticPagesController < ApplicationController
	before_action :require_login

	def index
    @location = "home"
    @post = Post.new
    @comment = Comment.new
    @users = User.all
	end

end
