require 'rails_helper'

describe Comment do
  before(:each) do
    @author = create(:user)
    @post = create(:post, author: @author)
  end
  it "is invalid without content" do 
    comment = build(:comment, author: @author, post: @post, content: "")

    expect(comment).to_not be_valid
  end
  it "is invalid without author" do
    comment = build(:comment, author: nil, post: @post, content: "Test")

    expect(comment).to_not be_valid
  end
  it "creates a comment with an author" do
    comment = build(:comment, author: @author, post: @post, content: "Test")

    expect(comment.author).to eq @author
  end
end  