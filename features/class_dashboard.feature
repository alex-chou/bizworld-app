Feature: view a particular class's dashboard

	As a teacher
	I want to be able to view a dashboard for each class
	So that I can track each class’s progress and administer pre/post tests

Background: one teacher and two classes have been added to the database

	Given the following teacher exists:
		| name 					| school			| city 			|
		| Armando Fox			| UC Berkeley		| Berkeley		|

		And the following classes eixts:
		| class id				| grade				| num students	|
		| 1						| 4					| 25			|
		| 2 					| 5					| 32			|

	And I am on the Teacher dashboard page

Scenario: create a new class
	When I click "Add class"
	Then I should see "Add new class"
	And I should see "Class Name:"
	And I should see "Grade:"
	And I should see "Number of students:"

Scenario: view a new class
	When I am on the Teacher dashboard page
	Then I should see "class-1" within "table#classes"
	And I should see "class-2" within "table#classes"