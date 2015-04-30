require 'spec_helper'

describe StudentsController do
  describe '#show' do
    before (:each) do
      sign_in_valid_teacher
      @classroom = FactoryGirl.create(:classroom, :teacher => @teacher)
      @student = FactoryGirl.create(:student, :classroom => @classroom)
      @student.surveys.create(:survey_type => 'pre')
      @student.surveys.create(:survey_type => 'post')
    end

    it 'should allow the teacher to see their student' do
      get "show", :teacher_id => @teacher.id, :classroom_id => @classroom.id, :id => @student.id
      response.should be_success
    end

    it 'should not not error on an invalid student id' do
      get "show", :teacher_id => @teacher.id, :classroom_id => @classroom.id, :id => 100
      response.should redirect_to(teacher_path(@teacher.id))
    end
  end

end
