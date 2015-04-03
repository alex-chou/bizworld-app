require 'uri'
require 'cgi'
Given /the following teacher is signed up/ do |teacher_table|
	teacher_table.hashes.each do |teacher|
		t = Teacher.new
		t.name = teacher[:name]
		t.school_name = teacher[:school_name]
		t.city = teacher[:city]
		t.state = teacher[:state]
		t.email = teacher[:email]
		t.username = teacher[:username]
		t.password = teacher[:password]
		t.save
	end
end

Given /^the teacher is signed in$/ do
  t = Teacher.first
  visit path_to('the login page')
  click_link('Login')
  fill_in('Email', :with => t.email)
  fill_in('Password', :with => 'password')
  click_button('Log in')
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

And /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end
