class StudentsController < ApplicationController
  before_filter :authenticate_teacher!

  def show
    @student = Student.find_by_id(params[:id])
    if not @student
      redirect_to teacher_path(current_teacher.id)
    end
  end

  def import
    #TODO: Is there a possible refactoring that will not rely on session?
    error = Student.import(params[:file], session["classroom_id"])
    if error.blank?
      flash[:notice] = "Students added."
      redirect_to classroom_path(session["classroom_id"])
    else
      flash[:notice] = error
      redirect_to (classroom_path(session["classroom_id"]) + "/add_students_form")
    end
  end
end
