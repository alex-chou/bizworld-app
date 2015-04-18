class Classroom < ActiveRecord::Base
  belongs_to :teacher
  has_many :classroom_students
  has_many :students, :through => :classroom_students
  attr_accessible :class_type, :end_date, :name, :program, :start_date, :link, :short_link
  validates_presence_of :teacher, :class_type, :name

  TEST_URLS = {'pre' => 'https://docs.google.com/forms/d/18fGk0NX-z_Slad4WvlpPQFAugEsRoyVqpcscx6o8cdM/viewform?',
                 'post' => 'https://docs.google.com/forms/d/1H7Wwbo8mTbnKpCwMr231ZjWixIUo6sHXm0M431vwHU0/viewform?'}

  def get_short_link(test_type)
    bitly = Bitly.client
    bitly.shorten(self.get_link(test_type)).short_url
  end

  def get_link(test_type)
    teacher = self.teacher
    params = {
      'entry.1019834039' => teacher.name,
      'entry.56447872' => teacher.city,
      'entry.1968199897' => teacher.state,
      'entry.1945527637' => self.id.to_s,
      'entry.514626172' => teacher.id.to_s
    }
    Classroom.replace_space(TEST_URLS[test_type] + params.to_query)
  end

  def self.replace_space(line)
    if line != nil
      line.gsub /( |%20)/, '+'
    end
  end

  def create_students(student_names)
    for student_name in student_names
      first_and_last = student_name.split(" ")
      first_name = first_and_last[0]
      last_name = first_and_last[1]
      self.students.create(:first_name => first_name, :last_name => last_name)
    end
  end
end
