FactoryGirl.define do
  factory :user do
    password 'password'
    password_confirmation 'password'
    sequence(:email) {|n| "user#{n}@localhost.localdomain" }
  end
end
