class PostsController < ApplicationController
  def new
  end

  def index
    @posts = current_user.feed
  end
end
