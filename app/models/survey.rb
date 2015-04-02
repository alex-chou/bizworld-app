class Survey < ActiveRecord::Base
  belongs_to :student
  has_many :questions, :through => :question_surveys
  attr_accessible :type
end
