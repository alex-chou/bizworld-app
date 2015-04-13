class StudentsController < ApplicationController
  before_filter :authenticate_teacher!

  def show
    @student = Student.find_by_id(params[:id])
    if not @student
      redirect_to teacher_path(current_teacher.id)
    end
  end


  # importing from an excel file currently works only if 
  # the first column is labeled with the header "first_name", and 
  # the second column is labeled with the header "last_name".
  def import
    Student.import(params[:file], session["classroom_id"])
    redirect_to root_url, notice: "Students added."
  end



end
