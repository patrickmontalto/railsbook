require "test_helper"

feature "UserPostCreation" do
  scenario "user creates valid post from their profile" do
    log_in_user
    visit user_path(@user)
    fill_in("post[content]", with: "This is my first test post.")
    click_button "Submit"
    # currently redirected to home page when posting from profile
    page.current_path.must_equal "/"
    page.must_have_content "Post created!"

    visit user_path(@user)
    page.must_have_content "This is my first test post."
  end

  scenario "user submits post without content form their profile" do
    log_in_user
    visit user_path(@user)
    fill_in("post[content]", with: " ")
    click_button "Submit"
    page.wont_have_content "Post created!"
  end

  scenario "user creates valid post from home page" do
    log_in_user
    visit root_path
    fill_in("post[content]", with: "This was posted from home!")
    click_button "Submit"

    page.current_path.must_equal "/"
    page.must_have_content "Post created!"

    visit user_path(@user)
    page.must_have_content "This was posted from home!"
  end


end
