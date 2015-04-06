require 'spec_helper'

describe SurveysController do
  describe '#create' do
    before :each do
      @classroom = Classroom.create
      @student = Student.create(:first_name => 'Aneesh', :last_name => 'Prasad')
      @classroom.students << @student
    end

    it 'works' do
      post :create, {:responses => {:first_name => 'Aneesh',
          :last_name => 'Prasad', :classroom_id => '1', :survey_type => 'pre'}}
      assigns(:survey).student.id.should equal @student.id
    end
  end

end
