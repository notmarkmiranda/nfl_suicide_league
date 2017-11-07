FactoryBot.define do
  factory :user_league do
    user
    league
    role 0
  end

  factory :user do
    sequence :email_address { |x| "test#{x}@example.com" }
    first_name "Test"
    last_name "Example"
    phone_number "3104047644"
    password "password"
  end

  factory :league do
    sequence :name { |x| "league number #{x}" }
  end

  factory :season do
    sequence :year { |x| (2000 + x).to_s }
  end
end
