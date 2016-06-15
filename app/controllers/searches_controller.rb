class SearchesController < ApplicationController
  def show
    search = Search.new(params[:search])
    users = search.users.paginate(:page => params[:page])
    render "users/_users", locals: {users: users}
  end
end