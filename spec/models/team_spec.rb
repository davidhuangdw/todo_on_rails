require 'rails_helper'

describe Team, type: :model do
  let(:team){build(:team)}
  let(:team_blank_name){build(:team, name:"")}

  it "should refuse team with blank name" do
    expect(team).to be_valid
    expect(team_blank_name).to be_invalid
  end

  context "when add users into a team" do
    let(:user){create(:user)}
    let(:admin){create(:user)}
    let(:participant){create(:user)}
    let(:participant2){create(:user)}
    let(:external){create(:user)}
    let(:team) do
      create(:team)
          .add_member(participant)
          .add_member(participant2)
          .add_member(admin,role:'admin')
          .add_member(external,role:'external')
    end

    it "should able to add user with different roles" do
      expect(team.participants).to eq [participant, participant2]
      expect(team.admins).to eq [admin]
      expect(team.externals).to eq [external]
    end

    it "should not add user with invalid role" do
      expect{ team.add_member(user, role:'xxx')}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not add same user multiple times" do
      expect{team.add_member(admin, role:'external')}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
