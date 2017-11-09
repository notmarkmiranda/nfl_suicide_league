FactoryBot.define do
  factory :pick do
    user_league
    team
    game
  end

  factory :game do
    start "14:41:15"
    association :home_team, factory: :team
    association :away_team, factory: :team
    week
    completed false
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
    sequence :phone_number { |x| (3104047644 + x).to_s }
    password "password"
  end

  factory :league do
    sequence :name { |x| "league number #{x}" }
  end

  factory :season do
    sequence :year { |x| (2000 + x).to_s }
  end

  factory :week do
    season
    sequence :number { |x| 1 + x }
    start_date "2017-11-05"
    end_date "2017-11-08"
  end
end
