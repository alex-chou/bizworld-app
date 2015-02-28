class Teacher < ActiveRecord::Base
  has_many :students, :through => :classrooms
  attr_accessible :name, :classroom
end
