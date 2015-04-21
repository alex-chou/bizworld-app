require 'spec_helper'

describe Survey do
  before (:each) do

    @correct_answers = Survey.key_dictionary
    @wrong_answers = {"A" => "James", "B" => "Jimmy", "E" => "Joe"}

    master = Student.master_student
    master_survey = master.surveys.create(:survey_type => 'pre',
                                          :version => 1,
                                          :score => 100,
                                          :master => true)
    master_survey.populate @correct_answers


    @student = Student.create(:first_name => 'Foo', :last_name => 'Bar')
    @student_survey = @student.surveys.create(:survey_type => 'pre',
                                     :version => 1,
                                     :master => false)

    @survey = FactoryGirl.create(:survey)
    @questions = {"A" => "Alice", "B" => "Bob", "E" => "Eve"}
    @non_questions = {"First Name" => "Foo", "Last Name" => "Bar", "Classroom ID" => 23, "Survey Type" => "pre"}

  end

  describe '#grade' do
    it 'should grade an empty survey properly' do
      @student_survey.grade
      assert @student_survey.score == 0
    end

    it 'should grade a correct survey properly' do
      @student_survey.populate @correct_answers
      @student_survey.grade
      @student_survey.score.should == 100
    end

    it 'should grade a wrong survey properly' do
      @student_survey.populate @wrong_answers
      @student_survey.grade
      assert @student_survey.score == 0
    end

    it 'should not grade an ungraded survey' do
    end
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
end
