require 'rails_helper'

feature 'Team management', type: :feature do
  context "When not login" do
    let(:msg_require_login){"Require login"}
    it "should not able to access team index" do
      visit teams_path
      expect(current_path).to eq root_path
      expect(page).to have_content(msg_require_login)
    end
  end

  let(:user){create(:user)}
  let(:team){build(:team)}
  context "When login" do
    before{ login_as(user); visit teams_path }
    it "can add a new team, and become its admin" do
      expect(current_path).to eq teams_path
      click_link 'New Team'
      fill_in 'Name', with:team.name
      expect{click_button 'Create'}.to change(Team, :count).by(1)

      expect(current_path).to eq team_path(Team.last)
      expect(page).to have_content('Admins')
      expect(page).to have_link(user.username, href:user_path(user))
    end
  end
end
