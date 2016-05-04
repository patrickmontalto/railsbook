require 'rails_helper'

feature 'user visits own profile' do
  before :each do
    @user = create(:user)
    @friend = create(:user, name: "Test Friend")
    friendship = create(:friendship, user: @user, friend: @friend)
    sign_in_as @user
    visit user_path(@user) 
  end

  scenario 'and sees relevant details on the page' do
    expect(page).to have_content @user.name
    expect(page).to have_link @friend.name
    expect(page).to have_link 'Unfriend'
  end

  scenario 'and successfully unfriends a friend', js: true do
    find('.friend').hover
    find_hidden('a.remove-friend-link').click

    page.driver.browser.switch_to.alert.accept

    expect(page).to_not have_content @friend.name
  end
end