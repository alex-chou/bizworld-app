class StudentsController < ApplicationController

  before_filter :authenticate_teacher!

  def show
    @student = Student.find(params[:student_id])
  end

end
