require 'rails_helper'

describe Post do
  it "is invalid without an author" do
    post = build(:post, author: nil)

    expect(post).to_not be_valid
  end

  it "is invalid without content" do
    post = build(:post, content: nil)

    expect(post).to_not be_valid
  end

  it "has likes" do
    post = create(:post)
    like = create(:like, post: post)

    expect(post.likes.count).to eq(1)
  end

  it "has comments" do
    post = create(:post)
    comment = create(:comment, post: post)
  
    expect(post.comments.count).to eq(1)
  end

end

