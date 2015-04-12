module ValidUserRequestHelper
  def sign_in_as_a_valid_user
    @teacher ||= FactoryGirl.create :teacher
    post_via_redirect teacher_session_path, 'teacher[email]' => @teacher.email, 'teacher[password]' => @teacher.password
  end
end

RSpec.configure do |config|
  config.include ValidUserRequestHelper, :type => :request
end
