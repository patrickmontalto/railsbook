class DashboardController < ApplicationController
  before_action :require_login
  def show
    @dashboard = Dashboard.new(current_user)
  end
end
