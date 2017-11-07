FactoryBot.define do
  factory :game do
    date "2017-11-07"
    start_time "14:41:15"
    home_id 1
    away_id 1
    h_score 1
    a_score 1
    week 1
    completed false
    season
  end

  factory :team do
    sequence :abbreviation { |x| "DEN#{x}" }
    sequence :name { |x| "Broncos #{x}" }
  end

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
