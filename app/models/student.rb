class Student < ActiveRecord::Base
  has_many :classrooms, :through => :classroom_students
  has_many :surveys
  attr_accessible :id, :name, :grade, :gender, :ethnicity, :classroom, :survey
end
