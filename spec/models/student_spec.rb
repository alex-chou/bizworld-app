require 'spec_helper'

describe Student do
  before (:each) do
    @student = Student.create()
  end

  describe "#get_survey" do
    it 'should return the pre result' do
      pre_survey = @student.surveys.create(:survey_type => 'pre', :score => 25.4)
      @student.get_survey('pre').should == pre_survey
      @student.get_survey_score('pre').should == pre_survey.score
    end

    it 'should return the post result' do
      post_survey = @student.surveys.create(:survey_type => 'post', :score => 38.4)
      @student.get_survey('post').should == post_survey
      @student.get_survey_score('post').should == post_survey.score
    end

    it 'should return N/A with no survey result' do
      @student.get_survey('pre').should == nil
      @student.get_survey_score('pre').should == "N/A"
      @student.get_survey('post').should == nil
      @student.get_survey_score('post').should == "N/A"
    end
  end

end
