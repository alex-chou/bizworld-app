class TeachersController < ApplicationController
  before_filter :authenticate_teacher!, except: [:index]

	def index
    if !current_teacher
      redirect_to new_teacher_session_path
    else
      redirect_to teacher_path(current_teacher.id)
    end
	end

	def show
    if !current_teacher
      session[:teacher] = Teacher.find(params[:id])
    end
    if params[:id].to_i != current_teacher.id
      flash[:notice] = "You cannot access that page"
      redirect_to teacher_path(:id => session[:teacher].id)
    end
    @teacher = current_teacher
	end

  def new
  end

end
