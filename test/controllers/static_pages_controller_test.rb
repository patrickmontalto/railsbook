require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test 'index prompts for login when not logged in' do
  	get :index
  	assert_redirected_to new_user_session_path
  end

  test 'index renders when signed in' do
  	sign_in users(:patrick)
  	get :index
  	assert_template 'static_pages/index'
  end
end
