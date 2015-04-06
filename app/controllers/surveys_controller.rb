class SurveysController < ApplicationController

  def create
    if !params.include?(:responses)
      return
    end
    @responses = params[:responses]
    first_name = @responses[:first_name]
    last_name = @responses[:last_name]
    classroom_id = @responses[:classroom_id]
    survey_type = @responses[:survey_type]

    @classroom = Classroom.find_by_id classroom_id

    @student = @classroom.students.find_by_first_name_and_last_name(first_name,
                                                                    last_name)
    @survey = @student.surveys.create :survey_type => survey_type
    @survey.populate @responses
    @survey.grade

    render json: {success: true}
  end

end
