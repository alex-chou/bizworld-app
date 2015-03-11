require 'uri'
require 'cgi'
Given /the following teacher exists/ do |teacher_table|
	teacher_table.hashes.each do |teacher|
		t = Teacher.new
		t.name = teacher[:name]
		t.school_name = teacher[:school]
		t.city = teacher[:city]
		t.state = teacher[:state]
		t.email = teacher[:email]
		t.username = teacher[:username]
		t.save
	end
end


Given /the following classrooms belong to the teacher/ do |classrooms_table|
	classrooms_table.hashes.each do |classroom|
		t = Teacher.first
		c = t.classrooms.new
		c.name = classroom[:name]
		c.program = classroom[:program]
		c.class_type = classroom[:classroom_type]
		start_date_array = classroom[:start_date].split('-')
		end_date_array = classroom[:end_date].split('-')
		c.start_date = Date.new(start_date_array[2].to_i, start_date_array[1].to_i, start_date_array[0].to_i)
		c.end_date = Date.new(end_date_array[2].to_i, end_date_array[1].to_i, end_date_array[0].to_i)
		c.save
	end
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end


Then /^(?:|I )should see "([^"]*)"$/ do |text|
  puts(Teacher.first.classrooms)
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
