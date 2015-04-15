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
    @teacher = current_teacher
    if params[:id].to_i != @teacher.id
      flash[:notice] = "You cannot access that page"
      redirect_to teacher_path(@teacher.id)
    end
	end
end
