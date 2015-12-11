require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:one)
  end
  test "post should have author" do
    assert @post.author
  end

  test "post should have likes" do
    assert_equal(@post.likes.count, 2)
  end

  test "post should have comments" do
    comment = comments(:one)
    assert_equal(@post.comments.count, 2)
    assert_equal(@post.comments.last, comment)
  end
end
