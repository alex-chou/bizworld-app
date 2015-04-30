class Survey < ActiveRecord::Base
  belongs_to :student
  has_many :question_surveys
  has_many :questions, :through => :question_surveys
  attr_accessible :survey_type, :score, :version, :master
  validates_presence_of :student, :survey_type

  NON_QUESTIONS = ["First Name", "Last Name", "Classroom ID", "Survey Type", "Teacher Name",
                   "City Name", "State", "Grade", "Gender", "Ethnicity"]


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
      self.score = (self.score * 100.0 / num_questions).round
    end
    self.save
    self.score
  end

  def get_answer(question)
    question = self.questions.find_by_question(question)
    if question
      return question.answer
    else
      nil
    end
  end

  def num_questions
    self.questions.length
  end

  def self.current_version
    return 1
  end

  def self.key_dictionary
    {"1. How can a company know it made a profit?" => "It earned more money in revenue than it spent on expenses",
    "2. If you take out a loan from the bank, you must:" => "Repay the balance of the loan and interest",
    "3. Your company made 10 of the same bracelet. Your total expenses, including bracelet materials, were $80. To make a profit how much should each bracelet cost?" => "$9",
    "4. What does a venture capitalist receive in exchange for investing in a company?" => "Shares of stock in the company and a vote in decision-making.",
    "5. Why is it important to keep careful records of all your finances?" => "All of the above.",
    "6. If a company sells shares of stock, the company is:" => "Losing a part of the ownership of the company in exchange for money.",
    "7. What is the profit equation?" => "Revenue - Expenses = Profit (or Loss)",
    "8. Money a company earns from selling a product or service is called:" => "Revenue.",
    "9. The most important goal of marketing is to:" => "All of the above.",
    "10. When developing a product, during the manufacturing stage the company needs to:" => "Make the product quickly and with limited waste.",
    "11. When deciding on a price for a product, what factor(s) should a company consider?" => "All of the above."
    }
  end

  def self.self_eval_questions
    ["I make an effort to get along with my teammates.",
     "I am confident speaking in front of others.",
     "I think about the advantages and disadvantages of a choice before making a decision.",
     "The things I learn in school will help me in the real world.",
     "I am confident leading others.",
     "I listen to other people's ideas while working in a group.",
     "How I say something is just important as what I say.",
     "I am able to motivate others.",
     "I analyze the effects of my decisions.",
     "I think that math is important.",
     "I discuss my ideas with others.",
     "I can come to a compromise with others when we disagree.",
     "I develop different ways of solving a problem.",
     "I take charge on work that needs to get done.",
     "I think learning is fun.",
     "I contribute and pitch in when working in a group."
    ]
  end

  def self.pre_free_response
    []
  end

  def self.post_free_response
    ["What have you learned about teamwork BizWorld?", "What have you learned about leadership from BizWorld?",
      "What advice would you give to a new student about to begin BizWorld?", "What do you know about managing money from BizWorld?"]
  end


end
