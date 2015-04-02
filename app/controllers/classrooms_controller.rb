class ClassroomsController < ApplicationController

	def new
		@teacher = session[:teacher]
	end

	def create
		@teacher = session[:teacher]
		@teacher.classrooms.create(params[:classroom])
		redirect_to teacher_path(@teacher)
	end

  def show
    @classroom = Classroom.find(params[:id])
  end

  def create_link
    if not @classroom
      @classroom = Classroom.find(params[:id])
    end
    @prefilledURL = @classroom.get_short_link
  end

end
