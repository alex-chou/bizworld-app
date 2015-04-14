# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do |count0|
  teacher = Teacher.create!(city: "Berkeley", email: "bob#{count0}@gmail.com", name: "Bob Alice#{count0}", school_name: "UC Berkeley", state: "CA", username: "bob#{count0}", password: "password")
  3.times do |count1|
    classroom = teacher.classrooms.create!(name: "MWF#{count1} #{count1}-#{count1 + 1} PM", class_type: count1.to_s, program: "bizworld")
    12.times do |count2|
      student = classroom.students.create!(first_name: "Eve#{count2}", last_name: "Casey", age: (count0+count1+count2).to_s, gender: "female", ethnicity: "Decline to Respond",
                                           school_name: "Cal Elementary", state: "CA", teacher_name: "Armando Fox", grade: 4)
      if count2 % 2 == 0
        student.surveys.create(:survey_type => 'pre', :score => count2 * 2.5)
      end
      if count2 % 3 == 0
        student.surveys.create(:survey_type => 'post', :score => count2 * 3.5)
      end
    end
  end
end
