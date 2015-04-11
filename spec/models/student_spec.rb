require 'spec_helper'

describe Student do
  before (:each) do
    @student = Student.create(first_name: "Alice", last_name: "Bob")
  end

  describe "#get_survey and #get_survey_score" do
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

  describe "#name" do
    it 'should return the student\'s first and last name' do
      @student.name.should == "#{@student.first_name} #{@student.last_name}"
    end
  end

  describe "#create" do
    it 'should not allow a student without a first and last name to be created' do
      Student.new().should_not be_valid
    end

    it 'should not allow a student without a last name to be created' do
      Student.new(first_name: "Alice").should_not be_valid
    end

    it 'should not allow a student without a first name to be created' do
      Student.new(last_name: "Bob").should_not be_valid
    end
  end
end
