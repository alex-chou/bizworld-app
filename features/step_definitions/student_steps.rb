require 'uri'
require 'cgi'

Then /^"(.*)" should have a pre-score of (.*) and a post-score of (.*)$/ do |student, pre, post|
  page.should have_css("table", pre)
  page.should have_css("table", post)
end