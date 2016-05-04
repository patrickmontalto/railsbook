require 'rails_helper'

feature 'User friend requests' do
  scenario "can be seen by user" do
    user =  create(:user)
    create(:friendship, friend: user, accepted: false)
    sign_in_as user

    visit requests_path

    expect(page).to have_content 'Accept'
  end
end