Feature: View classes on the dashboard
	As a teacher
	I want to be able to view my classes on a dashboard page
	So that I can view all my class information and create a new class

Background: Teacher exists and has multiple classes

  Given the following teacher exists:
  | name         | school       | city         |
  | Armando Fox  | UC Berkeley  | Berkeley     |

  And the following classes exists:
  | class_id | grade   | teacher     | num_students |
  | 2		 | 7	   | Armando Fox | 26           |
  | 4        | 9       | Armando Fox | 32           |

Scenario: View all classes
	When I am on the teacher dashboard page
	I should see "Class 2"
	And I should see "Class 4"

Scenario: View specific class
	When I am on the teacher dashboard page
	And I click "Class 2"
	I should see "Administer pretest"
	And I should see "Administer posttest"
	And I should see "Class 2"
	And I should not see "Class 4"