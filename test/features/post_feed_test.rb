require "test_helper"

feature "PostFeed" do
  scenario "user's home page has a feed of friend's posts" do
    log_in_user
    page.must_have_content("User one")
    page.must_have_content("Patrick M")
    page.must_have_content("This is a post.")
    page.must_have_content("This post is great.")
  end
end
