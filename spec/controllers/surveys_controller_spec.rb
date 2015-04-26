require 'spec_helper'

describe SurveysController do
  describe '#create' do
    before :each do
      @classroom = FactoryGirl.create(:classroom)
      @student = FactoryGirl.create(:student, :classroom => @classroom)
    end

    it 'finds existing student and adds survey' do
      post :create, {
        'responses' => {
          'First Name' => @student.first_name,
          'Last Name' => @student.last_name,
          'Classroom ID' => @classroom.id,
          'Survey Type' => 'pre',
          'Question 1' => 'True'
        }
      }
      assigns(:survey).student.id.should equal @student.id
    end

    it 'creates new student and adds survey' do
      post :create, {
        'responses' => {
          'First Name' => 'Kevin',
          'Last Name' => 'Casey',
          'Classroom ID' => @classroom.id,
          'Survey Type' => 'pre',
          'Question 1' => 'True'
        }
      }
      assigns(:survey).student.id.should equal assigns(:student).id
    end

    it 'finds MASTER student and adds survey' do
      post :create, {'responses' =>
      {'First Name' => 'MASTER', 'Last Name' => 'MASTER',
        'Classroom ID' => 'MASTER', 'Survey Type' => 'pre',
        'Survey Version' => '1', 'Question 1' => 'True'}
      }
      assigns(:survey).student.id.should equal assigns(:student).id

    end

    it 'returns false if no responses' do
      expected = {:success => false}.to_json
      post :create
      response.body.should == expected
    end
  end
end
