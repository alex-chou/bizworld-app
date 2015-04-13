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

  def index
    @teacher = session[:teacher]
    redirect_to teacher_path(@teacher.id)
  end

  def create_link
    if not @classroom
      @classroom = Classroom.find(params[:id])
    end
    @prefilledURL = @classroom.get_short_link(params[:test_type])
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
