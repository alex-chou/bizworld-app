class Survey < ActiveRecord::Base
  belongs_to :student
  has_many :question_surveys
  has_many :questions, :through => :question_surveys
  attr_accessible :survey_type, :score
  validates_presence_of :student, :survey_type

  def populate(responses)
    # responses is a dictionary {"First Name":"Aneesh", "Question 1: How many people ...":"24", "Question 14": "How often ...":"Very Frequently",
    # "15: "How do you feel ...":"Great"}

    non_questions = ["First Name", "Last Name", "Classroom ID", "Survey Type"]
    responses.each do |question, answer|
      if !non_questions.include?(question)
        self.questions.create :question => question, :answer => answer
      end
    end
  end

  def grade
  end
end
