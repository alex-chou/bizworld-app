admin = Teacher.create(email: "admin@gmail.com", password: "password", city: "Berkeley", name: "admin", school_name: "UC Berkeley", state: "CA")
admin.admin = true
admin.save

case Rails.env
when "development"
  answers1 = {"1. How can a company know that it made a profit?" => "It earned more money in revenue than it spent on expenses",
              "2. If you take out a loan from the bank, you must" => "Repay the balance of the loan and interest",
              "3. Your company made 10 of the same bracelet. Your total expenses, including bracelet materials, were $80. To make a profit how much should each bracelet cost?" => "$9",
              "4. What does a venture capitalist receive in exchange for investing in a company?" => "Shares of stock in the company and a vote in decision-making.",
              "5. Why is it important to keep careful records of all your finances?" => "All of the above.",
              "6. If a company sells shares of stock, the company is:" => "Losing a part of the ownership of the company in exchange for money.",
              "7. What is the profit equation?" => "Revenue - Expenses = Profit (or Loss)",
              "8. Money a company earns from selling a product or service is called:" => "Revenue.",
              "9. The most important goal of marketing is to:" => "All of the above.",
              "10. The purpose of manufacturing is:" => "Make the product quickly and with limited waste.",
              "11. When deciding on a price for a product, what factor(s) should a company consider?" => "All of the above.",
              "I make an effort to get along with my teammates." => "5",
              "I am confident speaking in front of others." => "5",
              "I think about the advantages and disadvantages of a choice before making a decision." => "5",
              "The things I learn in school will help me in the real world." => "5",
              "I am confident leading others." => "5",
              "I listen to other people's ideas while working in a group." => "5",
              "How I say something is just important as what I say." => "5",
              "I am able to motivate others." => "5",
              "I analyze the effects of my decisions." => "5",
              "I think that math is important." => "5",
              "I discuss my ideas with others." => "5",
              "I can come to a compromise with others when we disagree." => "5",
              "I develop different ways of solving a problem." => "5",
              "I take charge on work that needs to get done." => "5",
              "I think learning is fun." => "5",
              "I contribute and pitch in when working in a group." => "5",
              "What have you learned about teamwork from school?" => "Everything",
              "What have you learned about leadership from school?" => "Everything",
              "What do you know about managing money?" => "Everything"
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
              "11. When deciding on a price for a product, what factor(s) should a company consider?" => "All of the above.",
              "I make an effort to get along with my teammates." => "4",
              "I am confident speaking in front of others." => "3",
              "I think about the advantages and disadvantages of a choice before making a decision." => "5",
              "The things I learn in school will help me in the real world." => "4",
              "I am confident leading others." => "5",
              "I listen to other people's ideas while working in a group." => "5",
              "How I say something is just important as what I say." => "3",
              "I am able to motivate others." => "5",
              "I analyze the effects of my decisions." => "5",
              "I think that math is important." => "4",
              "I discuss my ideas with others." => "5",
              "I can come to a compromise with others when we disagree." => "3",
              "I develop different ways of solving a problem." => "3",
              "I take charge on work that needs to get done." => "5",
              "I think learning is fun." => "5",
              "I contribute and pitch in when working in a group." => "5",
              "What have you learned about teamwork from school?" => "A good amount",
              "What have you learned about leadership from school?" => "A good amount",
              "What do you know about managing money?" => "A good amount"
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
              "11. When deciding on a price for a product, what factor(s) should a company consider?" => "The cost of the supplies to make the product, including operating costs for the business.",
              "I make an effort to get along with my teammates." => "2",
              "I am confident speaking in front of others." => "1",
              "I think about the advantages and disadvantages of a choice before making a decision." => "5",
              "The things I learn in school will help me in the real world." => "5",
              "I am confident leading others." => "3",
              "I listen to other people's ideas while working in a group." => "5",
              "How I say something is just important as what I say." => "2",
              "I am able to motivate others." => "3",
              "I analyze the effects of my decisions." => "5",
              "I think that math is important." => "5",
              "I discuss my ideas with others." => "4",
              "I can come to a compromise with others when we disagree." => "5",
              "I develop different ways of solving a problem." => "1",
              "I take charge on work that needs to get done." => "1",
              "I think learning is fun." => "5",
              "I contribute and pitch in when working in a group." => "5",
              "What have you learned about teamwork from school?" => "Hardly anything",
              "What have you learned about leadership from school?" => "Hardly anything",
              "What do you know about managing money?" => "Hardly anything"
              }

  3.times do |count0|
    teacher = Teacher.create!(city: "Berkeley", email: "bob#{count0}@gmail.com", name: "Bob Alice#{count0}", school_name: "UC Berkeley", state: "CA", password: "password")
    1.times do |count1|
      classroom = teacher.classrooms.create!(name: "MWF #{count1 + 1}-#{count1 + 2} PM", class_type: count1.to_s, program: "bizworld")
      8.times do |count2|
        student = classroom.students.create!(first_name: "Eve#{count2}", last_name: "Casey", age: (count0+count1+count2).to_s, gender: "female", ethnicity: "Decline to Respond",
                                             city_name: "Berkeley", school_name: "Cal Elementary", state: "CA", teacher_name: "Armando Fox", grade: 4)
        if count2 % 2 == 0
          survey = student.surveys.create(:survey_type => 'pre')
          survey.populate(answers1)
          survey.grade
          post_survey = student.surveys.create(:survey_type => 'post')
          post_survey.populate(answers1)
          post_survey.grade
        elsif count2 % 3 == 0
          survey = student.surveys.create(:survey_type => 'pre')
          survey.populate(answers2)
          survey.grade
          post_survey = student.surveys.create(:survey_type => 'post')
          post_survey.populate(answers1)
          post_survey.grade
        else
          survey = student.surveys.create(:survey_type => 'pre')
          survey.populate(answers2)
          survey.grade
          post_survey = student.surveys.create(:survey_type => 'post')
          post_survey.populate(answers1)
          post_survey.grade
        end
      end
    end
  end
end
