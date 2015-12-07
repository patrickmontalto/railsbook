require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'User should have posts' do
    user = users(:one)
    post = posts(:one)
    assert_equal(user.authored_posts.first, post)
  end

  test 'User should have friends' do
    user = users(:one)
    friend = users(:patrick)
    assert_equal(user.mutual_friends.first, friend)
  end

  test "User should have passive friends" do
    user = users(:patrick)
    friend = users(:one)
    assert_equal(user.passive_friends.first, friend)
  end

  test "User should have pending friends" do
    user = users(:one)
    pending_friend = users(:three)
    assert_equal(user.pending_friends.first, pending_friend)
  end

  test "User should have received friends" do
    user = users(:three)
    received_friend = users(:one)
    assert_equal(user.received_friends.first, received_friend)
  end
end
