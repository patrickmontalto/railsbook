module Features
  def sign_in_as(user)
    visit root_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Log in"
  end
  
  def log_in_user(user)
    login_as(user, :scope => :user)
  end
end