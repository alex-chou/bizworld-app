class Survey < ActiveRecord::Base
  belongs_to :student
  has_many :question_surveys
  has_many :questions, :through => :question_surveys
  attr_accessible :survey_type, :score, :version, :master

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
    # Find the correct version of master
    master = Student.master_student
    # ERROR: When version doesn't exist
    key = master.surveys.find_by_version self.version
    responses = self.questions

    self.score = 0

    # Compare corresponding questions with each other
    # Populate key and correct fields
    key.questions.each do |q|
      responses.each do |r|
        if r.question == q.question
          r.key = q.answer
          r.correct = r.answer == r.key
          if r.correct
            self.score = self.score + 1
          end
        end
      end
    end
  end
end
