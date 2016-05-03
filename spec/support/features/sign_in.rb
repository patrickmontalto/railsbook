module Features
  def log_in_user
    @user = users(:one)
    visit new_user_session_path
    fill_in "user[email]", with: "one@google.com"
    fill_in "user[password]", with: "password1"
    click_button "Log in"
  end
end