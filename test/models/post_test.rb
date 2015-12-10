require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post should have author" do
    post = posts(:one)
    assert post.author
  end

  test "post should have likes" do
    post = posts(:one)
    assert_equal(post.likes.count, 2)
  end
end
