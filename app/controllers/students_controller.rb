class StudentsController < ApplicationController
  before_filter :authenticate_teacher!

  def show
    @student = Student.find_by_id(params[:id])
    if not @student
      redirect_to teacher_path(current_teacher.id)
    else
      @teacher = current_teacher
      pre_questions = []
      post_questions = []
      student_pre = @student.get_survey('pre')
      if student_pre
        pre_questions = student_pre.questions
      end
      student_post = @student.get_survey('post')
      if student_post
        post_questions = student_post.questions
      end
      @test_display = pre_questions.zip(post_questions)
      @right_or_wrong_questions = Survey.key_dictionary
    end
  end

  def import
    begin
      error = Student.import(params[:file], session["classroom_id"])
    rescue(NoMethodError)
      error = "Please upload a file before clicking Import."
    end
    #TODO: Is there a possible refactoring that will not rely on session?
    if error.blank?
      flash[:notice] = "Students added."
      redirect_to classroom_path(session["classroom_id"])
    else
      flash[:notice] = error
      redirect_to (classroom_path(session["classroom_id"]) + "/add_students_form")
    end
  end
end
