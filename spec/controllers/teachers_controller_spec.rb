require 'spec_helper'

describe TeachersController do

  describe 'teacher logged in' do
    before (:each) do
      @teacher = Teacher.create!(city: "Berkeley", email: "bob@gmail.com", name: "Bob Alice", school_name: "UC Berkeley", state: "CA", username: "bob", password: "password")
      sign_in :teacher, @teacher
    end

    describe '#index' do
      it 'should show the teacher their own page' do
        get 'index'
        response.should redirect_to(teacher_path(@teacher.id))
      end

      it 'should redirect the teacher to their own page' do
        get 'index', :id => 0
        response.should redirect_to(teacher_path(@teacher.id))
      end
    end
  end

  describe 'teacher not logged in' do
    it 'should redirect to the login page' do
      get 'index'
      response.should redirect_to(new_teacher_session_path)
    end
  end

end
