require "rails_helper"

feature "User likes a post" do
  scenario "from their feed" do
    log_in_user
    # Click like link for 2nd post
    # Expect page to have "1 Like"
  end

  scenario "on a profile page" do
  end
end

feature "User unlikes a post" do
  scenario "from their feed" do
    log_in_user

    find("#post_1").find(".like-post").click

    page.must_have_content("1 Like")
  end

  scenario "from a profile page" do
  end
end
