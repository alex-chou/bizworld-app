class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)  
  	teacher_path(session['warden.user.teacher.key'][0][0])
  end

end
