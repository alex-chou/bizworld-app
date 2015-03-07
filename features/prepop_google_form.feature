Feature: prepopulate google form

	So that students don't have to worry about identifying their teachers,
	When they click the link given by their teachers,
	The survey they get linked to should have school and teacher info prepopulated

Background: one teacher and 2 classes have been added to the database
	
	Given the following teacher exists:
		| name 					| school			| city 			|
		| Armando Fox			| UC Berkeley		| Berkeley		|

		And the following classes eixts:
		| class id				| grade				| num students	|
		| 1						| 4					| 25			|
		| 2 					| 5					| 32			|

	And I am on the Teacher dashboard page

Scenario: prepopulate google form with certain parameters
	When I click "class_1"
	And I click "Administer pre-test"
	And I click "generated link"
	Then I should see "Armando Fox" in the "teacher" field
	And I should see "class-1" in the "class-id" field
	