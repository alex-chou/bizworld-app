require 'spec_helper'

describe Survey do
  before (:each) do
    master = Student.master_student
    master.surveys.create(:survey_type => 'pre', :version => 1,
                         :score => 100, :master => true)
    student = Student.create
    @survey = student.surveys.create(:survey_type => 'pre', :version => 1,
                                     :master => false)
    questions = {"A" => "Alice", "B" => "Bob", "E" => "Eve"}
    non_questions = {}
  end

  describe '#grade' do
    it 'should grade an empty survey properly' do
      @survey.grade
      assert @survey.score == 0
    end

    it 'should grade a correct survey properly' do
    end

    it 'should grade a wrong survey properly' do
    end
  end
end
