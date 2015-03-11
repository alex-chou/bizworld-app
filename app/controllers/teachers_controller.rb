class TeachersController < ApplicationController

	def index
    teacher = Teacher.first
    session[:teacher] = teacher
	  redirect_to teacher_path(teacher)
	end

	def show
    @teacher = session[:teacher]
	end

end
