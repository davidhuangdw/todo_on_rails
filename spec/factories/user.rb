FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "email#{n}@example.com"}
    sequence(:username){|n| "user#{n}"}
    password 'password'
    password_confirmation 'password'

    factory(:blank_name){username ""}

    factory(:blank_email){email ""}
    factory(:invalid_email_format){email "xx@yy"}

    factory(:blank_password){password ""}
    factory(:too_short_password){email ""}
    factory(:too_long_password){password "x"*73}
  end
end
