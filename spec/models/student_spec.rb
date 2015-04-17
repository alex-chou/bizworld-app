require "spec_helper"

describe Student do
  before (:each) do
    @student = FactoryGirl.create :student
  end

  describe "#get_survey and #get_survey_score" do
    it "should return the pre result" do
      pre_survey = FactoryGirl.create :survey, :student => @student
      @student.get_survey("pre").should == pre_survey
      @student.get_survey_score("pre").should == pre_survey.score
      @student.get_survey("post").should == nil
      @student.get_survey_score("post").should == "N/A"
    end

    it "should return the post result" do
      post_survey = FactoryGirl.create :survey, :student => @student, :survey_type => "post"
      @student.get_survey("pre").should == nil
      @student.get_survey_score("pre").should == "N/A"
      @student.get_survey("post").should == post_survey
      @student.get_survey_score("post").should == post_survey.score
    end

    it "should return N/A with no survey result" do
      @student.get_survey("pre").should == nil
      @student.get_survey_score("pre").should == "N/A"
      @student.get_survey("post").should == nil
      @student.get_survey_score("post").should == "N/A"
    end
  end

  describe "#name" do
    it "should return the student\"s first and last name" do
      @student.name.should == "#{@student.first_name} #{@student.last_name}"
    end
  end

  describe "#create" do
    it "should not allow a student without a first and last name to be created" do
      Student.new().should_not be_valid
    end

    it "should not allow a student without a last name to be created" do
      Student.new(first_name: "Alice").should_not be_valid
    end

    it "should not allow a student without a first name to be created" do
      Student.new(last_name: "Bob").should_not be_valid
    end
  end


  it "can upload a roster via spreadsheet" do
    @classroom = FactoryGirl.create :classroom
    @file = fixture_file_upload('/files/student_names.xlsx')
    Student.import(@file, @classroom.id)
    @jerry = Student.where(first_name:"Jerry", last_name: "Seinfeld")[0]
    @classroom.students.include?(@jerry).should eq(true)
  end

  it "will display an error if the spreadsheet has improper labels" do
    @classroom = FactoryGirl.create :classroom
    @file = fixture_file_upload('/files/improper_labels.xlsx')
    error_message = Student.import(@file, @classroom.id)
    error_message.include?("Unable to add students").should eq(true)
  end
end
