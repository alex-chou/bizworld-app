class Survey < ActiveRecord::Base
  belongs_to :student
  has_many :questions, :through => :question_surveys
  attr_accessible :survey_type, :score
  validates_presence_of :student, :survey_type
end
