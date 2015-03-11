require 'uri'
require 'cgi'
Given /the following classrooms exist/ do |classroom_table|
  classroom_table.hashes.each do |classroom|
    c = Classroom.new
    c.class_type = classroom[:grade]
    c.name = classroom[:name]
    c.teacher = Teacher.find_by_name(classroom[:teacher])
    c.save
  end
end

Given /^I am "(.*)" looking at "(.*)"$/ do |teacher_name, classroom_name|
  @teacher = Teacher.find_by_name(teacher_name)
  @classroom = Classroom.find_by_name(classroom_name)
  visit teacher_classroom_path(@teacher.id, @classroom.id)
end

And /^I want to administer a (pre|post)-test$/ do |test_type|
  click_link("Administer #{test_type}-test")
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
