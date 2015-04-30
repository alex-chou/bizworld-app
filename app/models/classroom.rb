class Classroom < ActiveRecord::Base
  belongs_to :teacher
  has_many :students
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
    valid_students = []
    invalid_students = []
    for student_name in student_names
      first_and_last = student_name.split(" ")
      if first_and_last.size < 2
        invalid_students << student_name
      else
        valid_students << student_name
        first_name = first_and_last[0]
        last_name = first_and_last[1]
        self.students.create(:first_name => first_name, :last_name => last_name)
      end
    end
    puts(invalid_students)
    return valid_students, invalid_students
  end

  def to_csv_score_overview
    CSV.generate do |csv|
      csv << ['First Name', 'Last Name', 'School Name', 'Teacher Name', 'City Name',
              'State', 'Grade', 'Gender', 'Ethnicity', 'Pre-score', 'Post-score']
      self.students.each do |student|
        csv << [student.first_name, student.last_name, student.school_name, student.teacher_name, student.city_name,
                student.state, student.grade, student.gender, student.ethnicity, student.get_survey_score('pre'),
                student.get_survey_score('post')]
      end
    end
  end
end
