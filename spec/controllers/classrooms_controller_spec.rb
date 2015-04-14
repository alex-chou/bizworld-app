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

  describe '#show' do
    it 'should not allow the teacher to access a nonexistant classroom' do
      get "show", :teacher_id => @teacher.id, :id => 100
      response.should redirect_to(teacher_path(@teacher.id))
    end

    it 'should not allow the teacher to access another teacher\'s classroom' do
      classroom = FactoryGirl.create :classroom
      get "show", :teacher_id => @teacher.id, :id => classroom.id
      response.should redirect_to(teacher_path(@teacher.id))
    end

    it 'should allow the teacher to see a classroom they have' do
      classroom = FactoryGirl.create :classroom, :teacher => @teacher
      get "show", :teacher_id => @teacher.id, :id => classroom.id
      response.should be_success
    end
  end

  it 'should be able to access a classroom just created' do
    post "create", :teacher_id => @teacher.id
    get "show", :teacher_id => @teacher.id, :id => @teacher.classrooms[0].id
    response.should be_success
  end
end
