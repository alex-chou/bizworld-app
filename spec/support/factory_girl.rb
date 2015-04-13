require 'factory_girl'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :teacher do
    id 1
    name "Alice Bob"
    email "bob@yahoo.com"
    password "password"
    password_confirmation "password"
  end
end
