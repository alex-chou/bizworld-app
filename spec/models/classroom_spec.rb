require 'spec_helper'

describe Classroom do
  before (:each) do
    @teacher = FactoryGirl.create(:teacher)
    @classroom = FactoryGirl.create(:classroom, :teacher => @teacher)
  end

  describe '#get_link' do
    it 'should create a new prepopulated google doc link' do
      link = @classroom.get_link('pre')
      link.include?(Classroom.replace_space(@teacher.name)).should be_true
      link.include?(Classroom.replace_space(@teacher.city)).should be_true
      link.include?(Classroom.replace_space(@teacher.state)).should be_true
    end

    it 'should return the same link if called multiple times' do
      link1 = @classroom.get_link('pre')
      link2 = @classroom.get_link('pre')
      expect(link1).to eq link2
    end
  end

  describe '#replace_space' do
    it 'should replace spaces with + signs' do
      Classroom.replace_space("Foo Bar%20Baz").should == "Foo+Bar+Baz"
    end

    it 'should work with input with no spaces' do
      Classroom.replace_space("Alice").should == "Alice"
    end

    it 'should not break on nil' do
      Classroom.replace_space(nil).should == nil
    end
  end

  describe '#create_students' do
    it "should allow a teacher to add students to their class" do
      student_names = ["Bryce Harper"]
      @classroom.create_students(student_names)
      @bryce = Student.where(first_name:"Bryce", last_name: "Harper")[0]
      @david = Student.create(first_name: "David", last_name: "Ortiz")[0]
      @classroom.students.include?(@bryce).should eq(true)
      @classroom.students.include?(@david).should eq(false)
    end
  end

end
