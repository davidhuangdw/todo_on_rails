require 'rails_helper'

describe User, :type => :model do
  let(:invalid_users) do
    %w{blank_name blank_email invalid_email_format blank_password
    too_short_password too_long_password}.map do |user|
      build(user.to_sym)
    end
  end
  let(:user) {build(:user)}

  it "accpet user with valid info" do
    expect(user).to be_valid
  end

  it "should refuse user with valid info" do
    invalid_users.each do |invalid_user|
      expect(invalid_user).to be_invalid
    end
  end

  it "should accept valid emails" do
    %w(a.b.c@example.com test_mail@gmail.com any@any.net email@test.br 123@mail.test).each do |email|
      user.email = email
      expect(user).to be_valid
    end
  end

  it "should refuse invalid emails" do
    %w{invalid_email_format 123 $$$ () ☃ bla@bla.}.each do |email|
      user.email = email
      expect(user).to be_invalid
    end
  end

end
