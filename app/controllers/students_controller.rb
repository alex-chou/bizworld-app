class StudentsController < ApplicationController
  before_filter :authenticate_teacher!

  def show
    @student = Student.find_by_id(params[:id])
    if not @student
      redirect_to teacher_path(current_teacher.id)
    end
  end


  def import
    error = Student.import(params[:file], session["classroom_id"])
    if error.blank?
      flash[:notice] = "Students added."
    else
      flash[:notice] = error
    end
    redirect_to "/classrooms/#{session["classroom_id"]}"
  end



end
