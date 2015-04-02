class StudentsController < ApplicationController

  before_filter :authenticate_teacher!

  def show
    @student = Student.find(params[:id])
    #To be changed once login is implemented
    @teacher = Teacher.first
  end

end
