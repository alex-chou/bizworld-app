class ClassroomsController < ApplicationController
  before_filter :authenticate_teacher!

  def create
  	teacher = current_teacher
  	teacher.classrooms.create(params[:classroom])
  	redirect_to teacher_path(teacher.id)
  end

  def show
    @teacher = current_teacher
    if !@teacher.classrooms.find_by_id(params[:id].to_i) and !@teacher.admin?
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
    @prefilledURL = @classroom.get_short_link(params[:test_type])
  end

  def score_overview
    classroom = Classroom.find(params[:id])
    respond_to do |format|
      format.html { render text: classroom.to_csv_score_overview}
      format.csv {send_data classroom.to_csv_score_overview}
    end
  end

  def add_students()
    if not @classroom
      @classroom = Classroom.find(params[:id])
    end
    student_names = []
    num_students = 50 # accept a maximum of 50 students at a time.
    for i in (1..num_students).to_a
      student_name = params[:students]["name" + i.to_s]
      if student_name != nil and student_name != ""
        student_names.append(student_name)
      end
    end
    valid_students, invalid_students = @classroom.create_students(student_names)
    if invalid_students != []
      message = "Please include a last name for "
      if invalid_students.size == 1
        message << invalid_students[0]
      else
        for student in invalid_students[0..-2]
          message << student + ", "
        end
        message << " and " + invalid_students[-1] + ". "
      end
    else
      message = ""
    end
    if valid_students != []
      message += "Students added to class: #{valid_students}"
    end
    if valid_students == [] and invalid_students == []
      flash[:notice] = "Enter student names below to add them to the class."
      redirect_to classroom_path(@classroom.id) + "/add_students_form"
    else
      flash[:notice] = message
      redirect_to classroom_path(@classroom.id)
    end
  end
end
