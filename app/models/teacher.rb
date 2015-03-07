class Teacher < ActiveRecord::Base
  has_many :classrooms
  attr_accessible :id, :name, :school_name, :city, :state, :email, :username, :classroom
end
