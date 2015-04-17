class StudentsController < ApplicationController
  before_filter :authenticate_teacher!

  def show
    @student = Student.find_by_id(params[:id])
    if not @student
      redirect_to teacher_path(current_teacher.id)
    end
    @teacher = current_teacher
  end

end
