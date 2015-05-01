Feature: Download raw data
As an admin
I want to be able to download raw data for students
So that I can analyze student test results as a whole

Background: Admin exists

  Given the following teacher is signed up:
  | name         | school_name  | city         | state | email                | username  | password |
  | Armando Fox  | UC Berkeley  | Berkeley     | CA    | armando@berkeley.edu | Armando   | password |

  And the following classrooms belong to the teacher:
  | name       | program     | class_type   | start_date | end_date  |
  | Monday 8AM | Bizworld    | After School | 1-1-2015   | 1-10-2015 |

  Given the admin is logged in

Scenario: Download Pre Test Data
  When I am on the admin dashboard page
  And I press "Download Pre Test Data"
  Then I should download a csv with pre test data

Scenario: Download Post Test Data
  When I am on the admin dashboard page
  And I press "Download Post Test Data"
  Then I should download a csv with post test data