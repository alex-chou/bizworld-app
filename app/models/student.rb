class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, :through => :classroom_students
  has_many :surveys
  attr_accessible :age, :ethnicity, :gender, :first_name, :last_name, :school_name, :teacher_name, :state, :grade, :city_name

  def name
    self.first_name + ' ' + self.last_name
  end

  def get_survey(survey_type)
    self.surveys.each do |survey|
      if survey.survey_type == survey_type
        return survey
      end
    end
    nil
  end

  def get_survey_score(survey_type)
    survey = get_survey(survey_type)
    if survey
      survey.score
    else
      "N/A"
    end
  end

end
