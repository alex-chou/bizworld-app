Feature: Download raw data
As an admin
I want to be able to download raw data for students
So that I can analyze student test results as a whole

Background: Admin exists

  And the admin is logged in

Scenario: Download Pre Test Data
  When I am on the admin dashboard page
  And I press "Download Pre Test Data"
  Then I should download a csv with pre test data

Scenario: Download Post Test Data
  When I am on the admin dashboard page
  And I press "Download Post Test Data"
  Then I should download a csv with post test data