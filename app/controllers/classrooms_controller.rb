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

  def create_link
    if not @classroom
      @classroom = Classroom.find(params[:id])
    end
    @prefilledURL = @classroom.get_short_link
    @teacher = session[:teacher]
  end

  def add_students_form
  end

  def add_students()
    if not @classroom
      @classroom = Classroom.find(params[:id])
    end
    student_names = []
    # debugger
    num_students = 50 # for now
    for i in (1..num_students).to_a
      student_index = "name" + i.to_s
      student_name = params[:students][student_index]
      if student_name != nil and student_name != ""
        student_names.append(student_name)
      end
    end
    @classroom.create_students(student_names)
    flash[:notice] = "Students added to class: #{student_names}"
    puts(params)
    redirect_to "/teachers/#{params[:teacher_id]}/classrooms/#{params[:id]}"
  end

end
