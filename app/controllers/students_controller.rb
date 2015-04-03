class StudentsController < ApplicationController

  before_filter :authenticate_teacher!

  def show
    classroom = Classroom.find(params[:classroom_id])
    @student = classroom.students.where(:id => params[:id])[0]
  end

end
