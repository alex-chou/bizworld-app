class TeachersController < ApplicationController
  before_filter :authenticate_teacher!, except: [:index]

	def index
    if !session[:teacher]
      redirect_to new_teacher_session_path
    else
      redirect_to teacher_path(session[:teacher].id)
    end
	end

	def show
    if !session[:teacher]
      session[:teacher] = Teacher.find(params[:id])
    end
    if params[:id].to_i != session[:teacher].id
      flash[:notice] = "You cannot access that page"
      redirect_to teacher_path(:id => session[:teacher].id)
    end
    @teacher = session[:teacher]
	end

  def new
  end

end
