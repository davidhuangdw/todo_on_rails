require 'populator'
require 'faker'

namespace :db do
  namespace :populate do
    desc "Add users"
    task users: :environment do
      30.times do
        User.create email:Faker::Internet.email,
            username: Faker::Name.name,
            password:'password',
            password_confirmation:'password'
      end
    end

    desc "Add teams"
    task teams: :environment do
      Team.populate 30 do |p|
        p.name = Faker::Company.name
      end
    end

    desc "Clean users & teams"
    task clean: :environment do
      [User, Team].each(&:delete_all)
    end
  end
end