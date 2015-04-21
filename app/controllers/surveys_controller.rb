class SurveysController < ApplicationController

  def create
    if !params.include?(:responses)
      return render :json => {success: false}
    end
    @responses = params['responses']

    first_name = @responses['First Name']
    last_name = @responses['Last Name']
    classroom_id = @responses['Classroom ID']
    survey_type = @responses['Survey Type']
    survey_number = @responses['Survey Version']

    if first_name == 'MASTER'
      @student = Student.master_student
      @survey = @student.surveys.create(:survey_type => survey_type,
                                        :version => survey_number,
                                        :score => 100,
                                        :master => true)
      @survey.populate @responses
      return render :json => {success: true}
    end

    @classroom = Classroom.find_by_id classroom_id
    @student = @classroom.students.find_by_first_name_and_last_name(first_name, last_name)

    if @student.nil?
      @student = @classroom.students.create(:first_name => first_name,
                                             :last_name => last_name)
    end
    @survey = @student.surveys.create(:survey_type => survey_type,
                                      :version => survey_number,
                                      :master => false)
    @survey.populate @responses
    score = @survey.grade

    if !score
      return render :json => {success: false}
    end

    render :json => {success: true}
  end

end
