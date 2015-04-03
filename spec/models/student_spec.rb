require 'spec_helper'

describe Student do
  describe "#get_survey" do

    it "with pre" do
      student = Student.create()
      pre_survey = student.surveys.create(:survey_type => 'pre')
      student.get_survey('pre').should == pre_survey
    end

    it 'with post' do
      student = Student.create()
      post_survey = student.surveys.create(:survey_type => 'post')
      student.get_survey('post').should == post_survey
    end
  end

end
