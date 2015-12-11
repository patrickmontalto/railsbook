require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test "comment must have content" do
    comment = Comment.new(author_id: 1, post_id: 1, content: " ")
    assert_not comment.valid?
  end

  test "comment must have author" do
    comment = Comment.new(post_id: 1, content: "Test")
    assert_not comment.valid?
  end

  test "comment should have author" do
    comment = comments(:one)
    author = users(:one)
    assert_equal(comment.author, author)
  end
end
