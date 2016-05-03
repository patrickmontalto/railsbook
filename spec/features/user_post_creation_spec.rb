require "rails_helper"

feature "UserPostCreation" do

  before(:all) do
    log_in_user
  end

  scenario "user creates valid post from their profile", js: true do
    visit user_path(@user)

    fill_in "post[content]", with: "This is my first test post."
    first(".post-footer").click_button "Post"

    page.must_have_content "This is my first test post."
  end

  scenario "user submits post without content form their profile", js: true  do
    visit user_path(@user)
    
    fill_in "post[content]", with: " "
    first(".post-footer").click_button "Post"

    page.must_have_content "Content can't be blank"
  end

  scenario "user creates valid post from home page", js: true  do
    visit root_path
    
    fill_in "post[content]", with: "This was posted from home!"
    first(".post-footer").click_button "Post"

    page.current_path.must_equal "/"
  end


end
