require 'spec_helper'

describe Survey do
  before (:each) do
    @survey = FactoryGirl.create(:survey)
    @questions = {"A" => "Alice", "B" => "Bob", "E" => "Eve"}
    @non_questions = {"First Name" => "Foo", "Last Name" => "Bar", "Classroom ID" => 23, "Survey Type" => "pre"}
  end

  describe "#populate" do
    it 'should not have any questions if only non-questions are included' do
      @survey.populate(@non_questions)
      @survey.questions.count.should == 0
    end

    it 'should add all the questions as a question in the survey' do
      @survey.populate(@questions)
      @survey.questions.count.should == @questions.count
    end

    it 'should update a question if it already exists for the survey' do
      @survey.populate(@questions)
      @questions["A"] = "Bob"
      @survey.populate(@questions)
      @survey.questions.count.should == @questions.count
      @survey.questions.find_by_question("A").answer.should == "Bob"
    end

    it 'should filter out the non-questions from questions' do
      @survey.populate(@questions.merge(@non_questions))
      @survey.questions.count.should == @questions.count
    end
  end

  describe '#grade' do
    #TODO: whenever we finish up grading
  end
end
