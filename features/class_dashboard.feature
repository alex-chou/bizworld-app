Feature: view a particular class's dashboard

	As a teacher
	I want to be able to view a dashboard for each class
	So that I can track each class’s progress and administer pre/post tests

Background: Teacher exists and has multiple classes

  Given the following teacher is signed up:
  | name         | school_name  | city         | state | email				        | username	| password |
  | Armando Fox  | UC Berkeley  | Berkeley     | CA    | armando@berkeley.edu | Armando 	| password |

  And the following classrooms belong to the teacher:
  | name       | program     | class_type   | start_date | end_date	 |
  | Monday 8AM | Bizworld    | After School | 1-1-2015   | 1-10-2015 |

  And the teacher is signed in

Scenario: view a new class
	When I am on the teacher dashboard page for "Armando Fox"
  And I follow "Monday 8AM"
  Then I should see "Information on class Monday 8AM"
  And I should see "Program: Bizworld"
  And I should see "Class Type: After School"
