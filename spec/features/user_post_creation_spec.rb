require "rails_helper"

feature "UserPostCreation" do

  before(:each) do
    @user = create(:user)
    sign_in_as @user
  end

  scenario "user creates valid post from their profile", js: true do
    visit user_path(@user)

    fill_in "post[content]", with: "This is my first test post."
    first(".post-footer").click_button "Post"

    expect(page).to have_content "This is my first test post."
    expect(page).to have_current_path(user_path(@user))
  end

  scenario "user submits post without content form their profile", js: true  do
    visit user_path(@user)
    
    fill_in "post[content]", with: " "
    first(".post-footer").click_button "Post"

    expect(page).to have_content "Content can't be blank"
    expect(page).to have_current_path(user_path(@user))
  end

  scenario "user creates valid post from home page", js: true  do
    visit root_path

    fill_in "post[content]", with: "This was posted from home!"
    first(".post-footer").click_button "Post"

    expect(page).to have_content "This was posted from home!"
    expect(page).to have_current_path(root_path)
  end


end
