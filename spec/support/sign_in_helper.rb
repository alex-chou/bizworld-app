module SignInHelper
  def sign_in(user = double('user'))
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_teacher).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_teacher).and_return(user)
    end
  end

  def sign_in_valid_teacher
    @teacher ||= FactoryGirl.create :teacher
    sign_in @teacher
  end
  #TODO: write sign in as admin
end

RSpec.configure do |config|
  config.include SignInHelper, :type => :controller
end
