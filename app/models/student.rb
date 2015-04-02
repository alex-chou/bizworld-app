class Student < ActiveRecord::Base
  has_many :classrooms, :through => :classroom_students
  has_many :surveys
  attr_accessible :age, :ethnicity, :gender, :name

  def get_survey(survey_type)
    self.surveys.each do |survey|
      if survey.survey_type == survey_type
        return survey
      end
    end
  end

end
