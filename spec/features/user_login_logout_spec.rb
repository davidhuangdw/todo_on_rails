require 'rails_helper'

feature 'User login logout', :type => :feature do
  before { visit '/' }

  context 'When login with an account' do
    let(:user) {create(:user)}
    let(:path_after_login) {user_path(user)}
    let(:message_after_login) {'successfully'}
    let(:message_fail_login) {'Invalid email or password'}
    let(:message_after_logout) {'successfully'}

    before {click_link 'Login'}

    it "should not login if password unmatched" do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '111'
      click_button 'Log In'
      expect(current_path).to eq sessions_path

      expect(page).to have_content(message_fail_login)
    end

    it "should be able to login and logout" do
      expect(current_path).to eq login_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'

      expect(current_path).to eq path_after_login
      expect(page).to have_content(message_after_login)
      expect(page).to have_link('Profile')
      expect(page).to have_link('Logout')
      expect(page).not_to have_link('Login')

      click_link 'Logout'
      expect(current_path).to eq root_path
      expect(page).to have_content(message_after_logout)
      expect(page).not_to have_link('Logout')
      expect(page).to have_link('Login')
    end
  end
end
