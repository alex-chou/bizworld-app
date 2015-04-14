class StudentsController < ApplicationController

  before_filter :authenticate_teacher!

  def show
    @student = Student.find(params[:student_id])
  end


  def import
    Student.import(params[:file], session["classroom_id"])
    redirect_to root_url, notice: "Students added."
  end



end
