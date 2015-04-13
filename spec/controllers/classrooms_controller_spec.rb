require 'spec_helper'

describe ClassroomsController do
  before (:each) do
    sign_in_valid_teacher
  end

  describe '#create' do
    it 'should create a new classroom tied to the teacher' do
      post "create", :teacher_id => @teacher.id
      response.should redirect_to(teacher_path(@teacher))
      Classroom.all[0].teacher.should == @teacher
    end
  end
end
