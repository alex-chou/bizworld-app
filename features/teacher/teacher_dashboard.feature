Feature: View classes on the dashboard
	As a teacher
	I want to be able to view my classes on a dashboard page
	So that I can view all my class information and create a new class

Background: Teacher exists and has multiple classes

  Given the following teacher is signed up:
  | name         | school_name  | city         | state | email				        | username	| password |
  | Armando Fox  | UC Berkeley  | Berkeley     | CA    | armando@berkeley.edu | Armando 	| password |

  And the following classrooms belong to the teacher:
  | name       | program     | class_type   | start_date | end_date	 |
  | Monday 8AM | Bizworld    | After School | 1-1-2015   | 1-10-2015 |

  And the teacher is signed in

Scenario: View all classes
	When I am on the teacher dashboard page for "Armando Fox"
	Then I should see "Monday 8AM"

Scenario: create a new class
  When I am on the teacher dashboard page for "Armando Fox"
  And I follow "Add new class"
  Then I should see "Create New Class"
  And I should see "Name"
  And I should see "Program"
  And I should see "Class Type"
  And I should see "Start Date"
  And I should see "End Date"
