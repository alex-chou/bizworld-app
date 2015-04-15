class TeachersController < ApplicationController
  before_filter :authenticate_teacher!, except: [:index]

	def index
    if !current_teacher.try(:admin?)
      if !current_teacher
        redirect_to new_teacher_session_path
      else
        redirect_to teacher_path(current_teacher.id)
      end
    end
    @teacher = current_teacher
	end

	def show
    if !session[:teacher]
      session[:teacher] = Teacher.find(params[:id])
    end
    if params[:id].to_i != current_teacher.id and !current_teacher.try(:admin?)
      flash[:notice] = "You cannot access that page"
      redirect_to teacher_path(@teacher.id)
    end
	end
end
