class Classroom < ActiveRecord::Base
  has_many :students, :through => :classroom_students
  attr_accessible :id, :name, :program, :class_type, :start_date, :end_date, :student
end
