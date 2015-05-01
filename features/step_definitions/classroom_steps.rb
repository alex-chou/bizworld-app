require 'uri'
require 'cgi'

When /I create the following class/ do |classroom_table|
  click_link 'Add new class'
  classroom_table.hashes.each do |classroom|
    fill_in('Name', :with => classroom[:name])
    fill_in('Program', :with => classroom[:program])
    fill_in('Class Type', :with => classroom[:class_type])
  end
  click_button 'Save Changes'
end

Given /the following classrooms belong to the teacher/ do |classrooms_table|
  t = Teacher.first
  classrooms_table.hashes.each do |classroom|
    class_hash = {}
    class_hash[:name] = classroom[:name]
    class_hash[:program] = classroom[:program]
    class_hash[:class_type] = classroom[:class_type]
    start_date_array = classroom[:start_date].split('-')
    end_date_array = classroom[:end_date].split('-')
    class_hash[:start_date] = Date.new(start_date_array[2].to_i, start_date_array[1].to_i, start_date_array[0].to_i)
    class_hash[:end_date] = Date.new(end_date_array[2].to_i, end_date_array[1].to_i, end_date_array[0].to_i)
    t.classrooms.create(class_hash)
  end
end

Given /the following classrooms exist/ do |classroom_table|
  classroom_table.hashes.each do |classroom|
    c = Classroom.new
    c.class_type = classroom[:grade]
    c.name = classroom[:name]
    c.teacher = Teacher.find_by_name(classroom[:teacher])
    c.save
  end
end

Given /the following students belong to the classroom/ do |students_table|
  c = Classroom.first
  students_table.hashes.each do |student|
    first_name = student[:first_name]
    last_name = student[:last_name]
    age = student[:age]
    gender = student[:gender]
    eth = student[:ethnicity]
    s = c.students.create(:first_name => first_name, :last_name => last_name, :age => age, :gender => gender, :ethnicity => eth)
    s.surveys.create(:survey_type => 'pre', :score => student[:pre_score])
    s.surveys.create(:survey_type => 'post', :score => student[:post_score])
  end
end

Given /^I am "(.*)" looking at "(.*)"$/ do |teacher_name, classroom_name|
  @classroom = Classroom.find_by_name(classroom_name)
  visit classroom_path(@classroom.id)
end

Then /^"(.*)" should be on the class roster$/ do |student|
  page.should have_content(student)
end

Then /^(?:I )should(n't)? see "([^"]*)" in the link$/ do |not_seen, value|
  if not not_seen
    value = value.split(" ").join("+")
    page.should have_content(value)
  end
end

Then /^I should(n't)? see the following in the link: (.*)$/ do |not_seen, values_list|
  values_list.split(", ").each do |value|
    step %Q{I should#{not_seen} see "#{value}" in the link}
  end
end

Then /^I should see the link to (?:Pre|Post)-Assessment$/ do
  page.should have_content("bit.ly")
end

When /^I add the following students via form/ do |student_table|
  i = 1
  student_table.hashes.each do |student|
    field = 'name' + i.to_s
    fill_in(field, :with => student[:name])
    i += 1
  end
  click_button 'Add Students'
end

When /^I import the student names spreadsheet (.*)$/ do |spreadsheet|
  attach_file(:file, File.join(Rails.root, 'features', 'upload-files', "#{spreadsheet}"))
  click_button "Import"
end

When /^I import the improper file (.*)$/ do |file|
  attach_file(:file, File.join(Rails.root, 'features', 'upload-files', "#{file}"))
  click_button "Import"
end

