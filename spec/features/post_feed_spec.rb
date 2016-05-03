require "rails_helper"

feature "User's dashboard displays posts" do
  scenario "of friends" do
    user = create(:user)
    friend = create(:user, name: "friend user", email: "friend@example.com")
    friendship = create(:friendship, friend: friend, user: user, accepted: true)
    create(:post, author: friend)

    sign_in_as user
    
    expect(page).to have_content("friend user")
    expect(page).to have_content("This is a post.")
  end
end
