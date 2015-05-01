class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :classrooms
  attr_accessible :city, :name, :school_name, :state
  validates_presence_of :city, :name, :school_name, :state

  def self.all_students_raw_data(type)
    CSV.generate do |csv|
      csv << ['First Name', 'Last Name', 'School Name', 'Teacher Name', 'City Name', 'State',
              'Grade', 'Gender', 'Ethnicity'] + Survey.key_dictionary.keys + Survey.self_eval_questions + Survey.free_response(type)
      Student.all.each do |student|
        if student == Student.master_student
          next
        end
        survey = student.get_survey(type)
        if survey
          csv_row = [student.first_name, student.last_name, student.school_name, student.teacher_name, student.city_name, student.state,
                student.grade, student.gender, student.ethnicity]
          Survey.key_dictionary.keys.each do |question|
            csv_row += [survey.get_answer(question)]
          end
          Survey.self_eval_questions.each do |question|
            csv_row += [survey.get_answer(question)]
          end
          Survey.free_response(type).each do |question|
            csv_row += [survey.get_answer(question)]
          end
          csv << csv_row
        end
      end
    end
  end
end
