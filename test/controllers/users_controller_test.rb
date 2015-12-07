require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @user = users(:patrick)
  end

  test "redirects profiles to login page when not logged in" do
  	get(:show, {'id' => "2"})
  	assert_redirected_to new_user_session_path
  end

  test "displays a profile when logged in" do
    sign_in @user
    get(:show, {'id' => "1"})
    assert_template 'users/show'
  end
end
