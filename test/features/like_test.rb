require "test_helper"

feature "Like" do
  scenario "user likes a post from their feed" do
    log_in_user
    # Click like link for 2nd post
    # Expect page to have "1 Like"
  end

  scenario "user likes a post on a profile page" do
  end

  scenario "user unlikes a post from their feed" do
    log_in_user
    page.all('')
    #last('.post-commands').click_link('Like')
    page.must_have_content("Unliked post!")
  end

  scenario "user unlikes a post from a profile page" do
  end
end
