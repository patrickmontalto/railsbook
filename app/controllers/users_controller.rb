class UsersController < ApplicationController
	before_action :require_login
	def profile
		@user = User.find(params[:id])
	end
end
