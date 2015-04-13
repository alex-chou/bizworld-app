RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :teacher do
    name "Alice Bob"
    email "bob@yahoo.com"
    password "password"
    password_confirmation "password"
    city "Berkeley"
    school_name "FooBarBaz"
    state "CA"
  end

  factory :survey do
    survey_type "pre"
  end

  factory :classroom do
    association :teacher, :factory => :teacher
  end
end
