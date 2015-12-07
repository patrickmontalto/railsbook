require 'test_helper'

class UserRequestsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:three)
    @other_user = users(:one)
    @friendship = Friendship.where(user_id: @user, friend_id: @other_user).first
    get new_user_session_path
    post user_session_path, user: { email: 'bob@show.com',
                                    password: 'password3'}
  end

  test "user can view their friend requests" do
    get requests_path
    assert_select "a[href=?]", friendship_path(@other_user), text: 'Accept'
  end
 
end
