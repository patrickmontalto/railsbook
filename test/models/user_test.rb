require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "User must have a name" do
    user = User.new(name: " ")
    assert_not user.valid?
  end

  test 'User should have posts' do
    user = users(:one)
    post = posts(:one)
    assert_equal(user.authored_posts.first, post)
  end

  test "User should be able to create posts" do
    user = users(:one)
    assert_difference 'Post.count', 1 do
      post = user.authored_posts.build(content: "test")
      post.save
    end
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

  test "User should be able to accept a friend" do
    user = users(:patrick)
    friend = users(:three)
    friendship = user.friendships.build(:friend_id => friend.id)
    friendship.save
    friend.accept_friend(friendship)
    assert_equal(user.mutual_friends.first, friend)
  end

  test "User should not be able to add a friend multiple times if currently friends" do
    user = users(:one)
    friend = users(:patrick)
    friendship = user.friendships.build(:friend_id => friend.id)
    assert_not friendship.valid?
  end

  test "User should not be able to add themselves as a friend" do
    user = users(:patrick)
    friendship = user.friendships.build(:friend_id => user.id)
    assert_not friendship.valid?
  end

  test "User should have feed of friends and self posts" do
    user = users(:one)
    self_post = posts(:one)
    friend_post = posts(:three)
    assert_equal(user.feed.last, self_post)
    assert_equal(user.feed.first, friend_post)
  end

  test "User should have many likes" do
    user = users(:one)
    assert_equal(user.liked_posts.count, 1)
  end

  test "User should have liked posts" do
    user = users(:one)
    post = posts(:one)
    assert_equal(user.liked_posts.first, post)
  end

  test "User can like a post" do
    user = users(:one)
    post = posts(:three)
    user.like(post)
    assert_equal(user.liked_posts.count, 2)
    assert_equal(post.likes.count, 1)
  end

  test "User can only like a post once" do
    user = users(:one)
    post = posts(:one)
    user.like(post)
    assert_equal(user.liked_posts.count, 1)
  end

  test "User can unlike a post" do
    user = users(:one)
    post = posts(:one)
    user.unlike(post)
    assert_equal(user.liked_posts.count, 0)
  end

  test "User should have comments" do
    user = users(:one)
    assert_equal(user.comments.count, 1)
  end

  test "User should have commented posts" do
    user = users(:one)
    post = posts(:one)
    assert_equal(user.commented_posts.first, post)
  end
end
