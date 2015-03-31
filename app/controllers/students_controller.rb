class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
    #To be changed once login is implemented
    @teacher = Teacher.first
  end

end
