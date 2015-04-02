class Question < ActiveRecord::Base
  has_many :surveys, :through => :question_surveys
end
