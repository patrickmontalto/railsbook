require 'rails_helper'

feature "Non-user visits profile page" do
  scenario "gets redirected to login page" do
    user = create(:user)

    visit user_path(user)

    expect(page.current_path).to eq new_user_session_path 
  end
end