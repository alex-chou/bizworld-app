class Student < ActiveRecord::Base
  has_many :teachers, :through => :classrooms
  has_many :surveys
  attr_accessible :name, :classroom, :survey
end
