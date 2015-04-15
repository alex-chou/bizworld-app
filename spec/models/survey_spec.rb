require 'spec_helper'

describe Survey do
  before (:each) do

    @correct_answers = {"A" => "Alice", "B" => "Bob", "E" => "Eve"}
    @wrong_answers = {"A" => "James", "B" => "Jimmy", "E" => "Joe"}

    master = Student.master_student
    master_survey = master.surveys.create(:survey_type => 'pre',
                                          :version => 1,
                                          :score => 100,
                                          :master => true)
    master_survey.populate @correct_answers


    @student = Student.create
    @survey = @student.surveys.create(:survey_type => 'pre',
                                     :version => 1,
                                     :master => false)
  end

  describe '#grade' do
    it 'should grade an empty survey properly' do
      @survey.grade
      assert @survey.score == 0
    end

    it 'should grade a correct survey properly' do
      @survey.populate @correct_answers
      @survey.grade
      assert @survey.score == 100

    end

    it 'should grade a wrong survey properly' do
      @survey.populate @wrong_answers
      @survey.grade
      assert @survey.score == 0
    end

    it 'should not grade an ungraded survey' do
    end
  end
end
