require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  test "redirects profiles to login page when not logged in" do
  	get(:profile, {'id' => "1"})
  	assert_redirected_to new_user_session_path
  end
end
