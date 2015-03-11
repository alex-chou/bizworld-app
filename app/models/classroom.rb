class Classroom < ActiveRecord::Base
  belongs_to :teacher
  has_many :classroom_students
  has_many :students, :through => :classroom_students
  attr_accessible :class_type, :end_date, :name, :program, :start_date
end
