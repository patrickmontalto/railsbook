class StaticPagesController < ApplicationController
	before_action :require_login

	def index
    @users = User.all
	end

end
