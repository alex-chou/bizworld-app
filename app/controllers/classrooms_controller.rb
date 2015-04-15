class ClassroomsController < ApplicationController
  before_filter :authenticate_teacher!

  def create
  	teacher = current_teacher
  	teacher.classrooms.create(params[:classroom])
  	redirect_to teacher_path(teacher.id)
  end

  def show
    teacher = current_teacher
    if !teacher.classrooms.find_by_id(params[:id].to_i)
      flash[:notice] = "You cannot access that classroom"
      redirect_to teacher_path(teacher.id)
    else
      @classroom = Classroom.find(params[:id])
    end
  end

  def create_link
    if not @classroom
      @classroom = Classroom.find(params[:id])
    end
    @prefilledURL = @classroom.get_short_link
  end
end
