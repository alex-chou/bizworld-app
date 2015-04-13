require 'spec_helper'

describe Classroom do
  before (:each) do
    @teacher = FactoryGirl.create(:teacher)
    @classroom = FactoryGirl.create(:classroom, :teacher => @teacher)
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
