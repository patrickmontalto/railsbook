require 'rails_helper'

describe User do
  before :each do
    @user = create(:user)
  end
  it "is invalid without a name" do
    invalid_user = build(:user, name: nil)

    expect(invalid_user).to_not be_valid
  end

  it "has posts" do
    post = create(:post, author: @user)

    expect(@user.authored_posts.count).to eq 1
  end

  it "can create posts" do
    post = @user.authored_posts.create(content: "Test")

    expect(@user.authored_posts).to include post
  end

  it "has friends" do
    create(:friendship, user: @user)

    expect(@user.mutual_friends.count).to eq 1
  end

  it "has passive friends" do
    create(:friendship, friend: @user, accepted: true)

    expect(@user.passive_friends.count).to eq 1
  end

  it "has pending friends" do
    pending_friend = create(:user)
    create(:friendship, user: @user, friend: pending_friend, accepted: false)

    expect(@user.pending_friends).to include pending_friend
  end

  it "has received friend request" do
    received_friend = create(:user)
    create(:friendship, user: received_friend, friend: @user, accepted: false)

    expect(@user.received_friends).to include received_friend
  end

  it "can accept a friend request" do
    friendship = create(:friendship, friend: @user, accepted: false)

    @user.accept_friend(friendship)

    expect(@user.mutual_friends.count).to eq 1

  end

end