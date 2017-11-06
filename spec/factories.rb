FactoryBot.define do
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
end
