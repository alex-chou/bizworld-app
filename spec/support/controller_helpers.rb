require 'devise'

module ValidUserHelper
  def sign_in_as(teacher)
    controller.stub :current_teacher => teacher
  end

  def sign_in_valid_teacher
    @teacher ||= FactoryGirl.create :teacher
    sign_in_as @teacher
  end

  def sign_out_teacher
    controller.stub :current_teacher => nil
  end

  #TODO: write sign in as admin
end

RSpec.configure do |config|
  config.include ValidUserHelper, :type => :controller
end
