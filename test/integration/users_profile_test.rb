require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest

  test 'users profile displays friends when logged in' do
    user = users(:one)
    get new_user_session_path
    post user_session_path, user: { email: 'one@google.com',
                                    password: 'password1'}
    get user_path(user)
    assert_template 'users/show'
  end
end
