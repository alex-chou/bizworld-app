class SurveysController < ApplicationController

  def create
    responses = params[:responses]
    first_name = responses["First Name"]
    last_name = responses["Last Name"]
    classroom = responses["Classroom"]
    survey_type = responses["Survey Type"]

    student = Student.find_by_classroom_and_first_name_and_last_name(classroom, first_name, last_name)
    survey = student.survey.create :survey_type => survey_type
    survey.populate responses
    survey.grade
  end

end
