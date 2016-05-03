require "rails_helper"

feature "post" do

  before :each do
     @user = create(:user)
     @friend = create(:user, name: "friend user", email: "friend@example.com")
     friendship = create(:friendship, friend: @friend, user: @user, accepted: true)
  end

  scenario "is liked by user" do
    create(:post, author: @friend)

    sign_in_as @user
    find(".like-post").click

    expect(page).to have_content "1 Like"
  end

  scenario "is unliked by user" do
    post = create(:post, author: @friend)
    create(:like, user: @user, post: post)

    sign_in_as @user
    find(".like-post").click

    expect(page).to have_content "0 Likes"
  end
end