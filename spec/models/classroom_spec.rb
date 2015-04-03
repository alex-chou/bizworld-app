require 'spec_helper'

describe Classroom do
  before (:each) do
    @teacher = Teacher.create(city: 'Berkeley', email: 'cs169-bizworld@bizworld.org', name: 'Armando Fox', school_name: 'UC Berkeley', state: 'CA', username: 'AFox', password: 'password')
    @classroom = @teacher.classrooms.create(name: 'MWF 3-4 PM', class_type: '3', program: 'bizworld')
  end

  describe 'get_link' do
    it 'should create a new prepopulated google doc link' do
      link = @classroom.get_link
      link.include?(Classroom.sanitize_field(@teacher.name)).should be_true
      link.include?(Classroom.sanitize_field(@teacher.city)).should be_true
      link.include?(Classroom.sanitize_field(@teacher.state)).should be_true
    end

    it 'should return the same link if called multiple times' do
      link1 = @classroom.get_link
      link2 = @classroom.get_link
      expect(link1).to eq link2
    end
  end
end
