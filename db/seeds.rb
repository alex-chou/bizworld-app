# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

answers1 = {"1. How can a company know it made a profit?" => "It earned more money in revenue than it spent on expenses",
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

answers2 = {"1. How can a company know it made a profit?" => "It earned the most revenue during sales",
            "2. If you take out a loan from the bank, you must:" => "Repay the balance of the loan and interest",
            "3. Your company made 10 of the same bracelet. Your total expenses, including bracelet materials, were $80. To make a profit how much should each bracelet cost?" => "$9",
            "4. What does a venture capitalist receive in exchange for investing in a company?" => "Shares of stock in the company and a vote in decision-making.",
            "5. Why is it important to keep careful records of all your finances?" => "All of the above.",
            "6. If a company sells shares of stock, the company is:" => "Losing a part of the ownership of the company in exchange for money.",
            "7. What is the profit equation?" => "Revenue - Expenses = Profit (or Loss)",
            "8. Money a company earns from selling a product or service is called:" => "Profit.",
            "9. The most important goal of marketing is to:" => "All of the above.",
            "10. When developing a product, during the manufacturing stage the company needs to:" => "Make the product quickly and with limited waste.",
            "11. When deciding on a price for a product, what factor(s) should a company consider?" => "All of the above."
            }

answers2 = {"1. How can a company know it made a profit?" => "It earned the most revenue during sales",
            "2. If you take out a loan from the bank, you must:" => "Repay the balance of the loan and interest",
            "3. Your company made 10 of the same bracelet. Your total expenses, including bracelet materials, were $80. To make a profit how much should each bracelet cost?" => "$9",
            "4. What does a venture capitalist receive in exchange for investing in a company?" => "Shares of stock in the company and a vote in decision-making.",
            "5. Why is it important to keep careful records of all your finances?" => "All of the above.",
            "6. If a company sells shares of stock, the company is:" => "Losing a part of the ownership of the company in exchange for money.",
            "7. What is the profit equation?" => "Revenue - Expenses = Profit (or Loss)",
            "8. Money a company earns from selling a product or service is called:" => "Profit.",
            "9. The most important goal of marketing is to:" => "Help increase sales of your product.",
            "10. When developing a product, during the manufacturing stage the company needs to:" => "Sell the product to your customers.",
            "11. When deciding on a price for a product, what factor(s) should a company consider?" => "The cost of the supplies to make the product, including operating costs for the business."
            }


5.times do |count0|
  teacher = Teacher.create!(city: "Berkeley", email: "bob#{count0}@gmail.com", name: "Bob Alice#{count0}", school_name: "UC Berkeley", state: "CA", password: "password")
  3.times do |count1|
    classroom = teacher.classrooms.create!(name: "MWF#{count1} #{count1}-#{count1 + 1} PM", class_type: count1.to_s, program: "bizworld")
    12.times do |count2|
      student = classroom.students.create!(first_name: "Eve#{count2}", last_name: "Casey", age: (count0+count1+count2).to_s, gender: "female", ethnicity: "Decline to Respond",
                                           city_name: "Berkeley", school_name: "Cal Elementary", state: "CA", teacher_name: "Armando Fox", grade: 4)
      if count2 % 2 == 0
        survey = student.surveys.create(:survey_type => 'pre', :version => 1)
        survey.populate(answers1)
        survey.grade
        post_survey = student.surveys.create(:survey_type => 'post', :version => 1)
        post_survey.populate(answers1)
        post_survey.grade
      elsif count2 % 3 == 0
        survey = student.surveys.create(:survey_type => 'pre', :version => 1)
        survey.populate(answers2)
        survey.grade
        post_survey = student.surveys.create(:survey_type => 'post', :version => 1)
        post_survey.populate(answers1)
        post_survey.grade
      else
        survey = student.surveys.create(:survey_type => 'pre', :version => 1)
        survey.populate(answers2)
        survey.grade
        post_survey = student.surveys.create(:survey_type => 'post', :version => 1)
        post_survey.populate(answers1)
        post_survey.grade
      end
    end
  end
end
