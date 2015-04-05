class SurveysController < ApplicationController

  def create
    if !params.include?(:responses)
      return
    end
    responses = params[:responses]
    first_name = responses["First Name"]
    last_name = responses["Last Name"]
    classroom = responses["Classroom"]
    survey_type = responses["Survey Type"]

    student = Student.joins(:classrooms).find(:student_first_name => first_name, :student_last_name => last_name, :classroom_id => classroom)
    survey = student.survey.create :survey_type => survey_type
    survey.populate responses
    survey.grade
  end

end
