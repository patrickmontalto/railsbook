class StaticPagesController < ApplicationController
	before_action :require_login

	def index
    @post = Post.new
    @users = User.all
	end

end
