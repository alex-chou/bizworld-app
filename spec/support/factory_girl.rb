RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :teacher do
    name "Alice Private"
    email "private@yahoo.com"
    password "password"
    password_confirmation "password"
    city "Berkeley"
    school_name "FooBarBaz"
    state "CA"
  end

  factory :classroom do
    association :teacher, :factory => :teacher
  end

  factory :student do
    classrooms {[FactoryGirl.create(:classroom)]}
    first_name "Alice"
    last_name "Private"
  end

  factory :survey do
    association :student, :factory => :student
    survey_type "pre"
    score 76.4
  end
end
