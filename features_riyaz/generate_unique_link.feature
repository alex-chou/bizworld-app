Feature: create a unique pre/post test link

	As a teacher
	I want to be able to administer class-unique pre/post tests
	So that I can give students a pre-populated survey to test their knowledge and progress

Background: one teacher and two classes have been added to the database

	Given the following teacher exists:
	| name 					| school			| city 			|
	| Armando Fox			| UC Berkeley		| Berkeley		|

	And the following classes eixts:
	| class id				| grade				| num students	|
	| 1						| 4					| 25			|
	| 2 					| 5					| 32			|

Scenario: generate link for class 1
	When I click "class_1"
	And I click "Administer Pre-test"
	Then I should see "Armando Fox" in the link
	And I should see "class-1" in the link
	



