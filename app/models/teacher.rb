class Teacher < ActiveRecord::Base
  has_many :classrooms
  attr_accessible :city, :email, :name, :school_name, :state, :username
end
