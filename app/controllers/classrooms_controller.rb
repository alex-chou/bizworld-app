class ClassroomsController < ApplicationController
  before_filter :authenticate_teacher!

  def new
  	@teacher = session[:teacher]
  end

  def create
  	@teacher = session[:teacher]
  	@teacher.classrooms.create(params[:classroom])
  	redirect_to teacher_path(@teacher)
  end

  def show
    @teacher = session[:teacher]
    params[:teacher_id] = @teacher.id
    if !@teacher.classrooms.include?(Classroom.find(params[:id].to_i))
      flash[:notice] = "You cannot access that classroom"
      redirect_to teacher_path(@teacher.id)
    end
    @classroom = Classroom.find(params[:id])
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
    @teacher = session[:teacher]
  end

end
