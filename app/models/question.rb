class Question < ActiveRecord::Base
  has_many :question_surveys
  has_many :surveys, :through => :question_surveys
  attr_accessible :question, :answer, :key, :correct
end
