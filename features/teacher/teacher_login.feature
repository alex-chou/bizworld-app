Feature: Login for teachers
  As a teacher
  I want to be able to be able to log into my own account
  So that I can access my saved classroom information

Background: Teacher exists and has multiple classes

  Given the following teacher is signed up:
  | name         | school_name  | city         | state | email                | username  | password  |
  | Armando Fox  | UC Berkeley  | Berkeley     | CA    | armando@berkeley.edu | Armando   | armando1  |

  And the following classrooms belong to the teacher:
  | name       | program     | class_type   | start_date | end_date  |
  | Monday 8AM | Bizworld    | After School | 1-1-2015   | 1-10-2015 |

Scenario: Log into a teacher account
  When I am on the login page
  And I follow "Login"
  And I fill in "teacher_email" with "armando@berkeley.edu"
  And I fill in "teacher_password" with "armando1"
  And I press "Log in"
  Then I should see "Armando Fox"

Scenario: Wrong user information
  When I am on the login page
  And I follow "Login"
  And I fill in "teacher_email" with "Stanford@stanford.edu"
  And I fill in "teacher_password" with "redredred"
  And I press "Log in"
  Then I should see "Invalid email or password"


