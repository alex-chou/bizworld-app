RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :teacher do
    name "Alice Private"
    sequence(:email) { |n| "private#{n}@yahoo.com" }
    password "password"
    password_confirmation "password"
    city "Berkeley"
    school_name "FooBarBaz"
    state "CA"
  end

  factory :classroom do
    association :teacher, :factory => :teacher
    class_type "bizworld"
    name "TuTh 3:30-5:00PM"
  end

  factory :student do
    association :classroom, factory: :classroom
    first_name "Alice"
    last_name "Private"
  end

  factory :survey do
    association :student, factory: :student
    survey_type "pre"
    sequence(:score) { |n| (n * 3.22) % 100 }
  end
end
