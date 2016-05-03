require "rails_helper"

feature "User's dashboard displays posts" do
  scenario "of friends" do
    log_in_user
    
    page.must_have_content("User one")
    page.must_have_content("Patrick M")
    page.must_have_content("This is a post.")
    page.must_have_content("This post is great.")
  end
end
