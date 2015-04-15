class ClassroomsController < ApplicationController
  before_filter :authenticate_teacher!

  def new
  	@teacher = current_teacher
  end

  def create
  	teacher = current_teacher
  	teacher.classrooms.create(params[:classroom])
  	redirect_to teacher_path(teacher)
  end

  def show
    @teacher = current_teacher
    params[:teacher_id] = @teacher.id
    if !@teacher.classrooms.find_by_id(params[:id].to_i)
      flash[:notice] = "You cannot access that classroom"
      redirect_to teacher_path(@teacher.id)
    else
      @classroom = Classroom.find(params[:id])
    end
  end

  def index
    @teacher = session[:teacher]
    redirect_to teacher_path(@teacher.id)
  end

  def create_link
    if not @classroom
      @classroom = Classroom.find(params[:id])
    end
    @prefilledURL = @classroom.get_short_link
    @teacher = current_teacher
  end
end
