class Survey < ActiveRecord::Base
  belongs_to :student
  attr_accessible :id, :type, :student
end
