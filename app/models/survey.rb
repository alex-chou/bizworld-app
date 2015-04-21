class Survey < ActiveRecord::Base
  belongs_to :student
  has_many :question_surveys
  has_many :questions, :through => :question_surveys
  attr_accessible :survey_type, :score, :version, :master
  validates_presence_of :student, :survey_type

  NON_QUESTIONS = ["First Name", "Last Name", "Classroom ID", "Survey Type"]

  def populate(responses)
    # responses is a dictionary {"First Name":"Aneesh", "Question 1: How many people ...":"24", "Question 14": "How often ...":"Very Frequently",
    # "15: "How do you feel ...":"Great"}

    responses.each do |question, answer|
      if !NON_QUESTIONS.include?(question)
        update = questions.find_by_question(question).try(:update_attributes, {:answer => answer})
        if !update
          questions.create :question => question, :answer => answer
        end
      end
    end
  end

  def grade
    # Find the correct version of master
    key = Student.master_key self.version
    if !key
      return nil
    end
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
            self.score += 1
          end
        end
        r.save
      end
    end

    if num_questions != 0
      self.score *= 100.0 / num_questions
    end
    self.save
    self.score
  end

  def num_questions
    self.questions.length
  end

  def self.current_version
    return 1
  end
end
