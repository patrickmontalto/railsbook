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
    assert_equal(user.friends.first, friend)
  end
end
