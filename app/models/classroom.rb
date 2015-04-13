class Classroom < ActiveRecord::Base
  belongs_to :teacher
  has_many :classroom_students
  has_many :students, :through => :classroom_students
  attr_accessible :class_type, :end_date, :name, :program, :start_date, :link, :short_link

  def get_short_link
    bitly = Bitly.client
    bitly.shorten(self.get_link).short_url
  end

  def get_link
    teacher = self.teacher
    %Q{https://docs.google.com/a/bizworld.org/forms/d/192Eqjup01aq3zAvTS-P9wFTCJZChaGNHDAusrUKMd6o/viewform?} +
      %Q{&entry.363323870=} + Classroom.sanitize_field(teacher.name) +
      %Q{&entry.819974938=} + Classroom.sanitize_field(teacher.city) +
      %Q{&entry.1920272073=} + Classroom.sanitize_field(teacher.state) +
      %Q{&entry.942453101&entry.1463927784}
  end

  def self.sanitize_field(field)
    if field != nil
      field.split(" ").join("+")
    end
  end
end
