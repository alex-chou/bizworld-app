class Classroom < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student
  attr_accessible :teacher, :student
end
