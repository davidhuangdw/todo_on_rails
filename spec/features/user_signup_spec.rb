require 'rails_helper'

feature 'User sign up', :type => :feature do
  before { visit '/' }

  context 'When create an account' do
    let(:user) {build(:user)}
    let(:message_after_create) {'successfully'}
    let(:message_fail_create) {"can't be blank"}

    before {click_link 'Sign Up'}

    it 'should not create an account with invalid info' do
      expect{click_button 'Create User'}.not_to change(User, :count)
      expect(current_path).to eq users_path
      expect(page).to have_content(message_fail_create)
    end

    it 'should be able to creat an account' do
      expect(current_path).to eq sign_up_path

      fill_in 'Email', with: user.email
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password, match: :prefer_exact
      fill_in 'Password confirmation', with: user.password_confirmation

      expect{click_button 'Create User'}.to change(User, :count).by(1)
      expect(current_path).to eq user_path(User.last)
      expect(page).to have_content(message_after_create)
    end
  end
end
