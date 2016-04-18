require 'test_helper'

class UserLikesTest < ActionDispatch::IntegrationTest
   def setup
    @user = users(:one)
    @other_user = users(:patrick)
    @friendship = Friendship.where(user_id: @user, friend_id: @other_user).first
    get new_user_session_path
    post user_session_path, user: { email: 'one@google.com',
                                    password: 'password1'}
  end

  test 'user can like a post from timeline' do
    get root_path
    post = posts(:two)
    assert_select "a[href=?]", like_post_path(post), text: "Like"
  end

  test 'user can like a post from a profile' do
    get user_path(@user)
    post = posts(:two)
    assert_select "a[href=?]", like_post_path(post), text: "Like"
  end
end
