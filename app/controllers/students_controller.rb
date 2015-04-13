class StudentsController < ApplicationController

  before_filter :authenticate_teacher!

  def show
    @student = Student.find(params[:student_id])
  end


  # importing from an excel file currently works only if 
  # the first column is labeled with the header "first_name", and 
  # the second column is labeled with the header "last_name".
  def import
    Student.import(params[:file], session["classroom_id"])
    redirect_to root_url, notice: "Students added."
  end



end
