require 'spec_helper'

describe Teacher do 

  describe '#all_students_raw_data pre' do
    student = Student.create(:first_name => 'Eve0', :last_name => 'Casey', :school_name => 'Cal Elementary', :teacher_name => 'Armando Fox',
                             :city_name => 'Berkeley', :state => 'CA', :grade => '4', :gender => 'female', :ethnicity => 'Decline to Respond')
    @survey = student.surveys.create(:survey_type => 'pre')
    @survey.populate({"1. How can a company know that it made a profit?" => "It earned more money in revenue than it spent on expenses",
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
            "I contribute and pitch in when working in a group." => "5"
          })
    @survey.grade
    it "should return the correct csv data" do 
      data = File.read("spec/fixtures/files/pre_sample.csv")
      Teacher.all_students_raw_data('pre').should == data
    end
  end

  describe '#all_students_raw_data post' do
    student = Student.create(:first_name => 'Eve0', :last_name => 'Casey', :school_name => 'Cal Elementary', :teacher_name => 'Armando Fox',
                             :city_name => 'Berkeley', :state => 'CA', :grade => '4', :gender => 'female', :ethnicity => 'Decline to Respond')
    @survey = student.surveys.create(:survey_type => 'post')
    @survey.populate({"1. How can a company know that it made a profit?" => "It earned more money in revenue than it spent on expenses",
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
            "What have you learned about teamwork BizWorld?" => nil,
            "What have you learned about leadership from BizWorld?" => nil,
            "What advice would you give to a new student about to begin BizWorld?" => nil,
            "What do you know about managing money from BizWorld?" => nil
          })
    @survey.grade
    it "should return the correct csv data" do 
      data = File.read("spec/fixtures/files/post_sample.csv")
      Teacher.all_students_raw_data('post').should == data
    end
  end

end
