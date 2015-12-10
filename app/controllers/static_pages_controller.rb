class StaticPagesController < ApplicationController
	before_action :require_login

	def index
    @location = "home"
    @post = Post.new
    @users = User.all
	end

end
