class Survey < ActiveRecord::Base
  belongs_to :student
  attr_accessible :type
end
