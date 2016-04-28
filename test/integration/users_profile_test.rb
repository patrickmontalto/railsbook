require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
    @other_user = users(:patrick)
    @friendship = Friendship.where(user_id: @user, friend_id: @other_user).first
    get new_user_session_path
    post user_session_path, user: { email: 'one@google.com',
                                    password: 'password1'}
  end

  test 'users profile displays friends when logged in' do
    get user_path(@user)
    assert_template 'users/show'
  end

  test 'administrative buttons on user profile as visitor' do
    get user_path(@other_user)
    # link to remove user as a friend
    assert_select "a[href=?]", friendship_path(@friendship)
  end

  test 'administrative buttons on user profile as current user' do
    get user_path(@user)
    # should not have button to add self as friend
    assert_select "a[href=?]", friendships_path(:friend_id => @user), false
    # should have ability to unfriend friends.
    assert_select "a[href=?]", friendship_path(@friendship), text: 'Unfriend'
  end

  test "unfriend a user" do
    assert_difference 'Friendship.count', -1 do
      delete friendship_path(@friendship)
    end
  end



end
