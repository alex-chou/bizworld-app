Feature: create a unique pre/post test link

  As a teacher
  I want to be able to administer class-unique pre/post tests
  So that I can give students a pre-populated survey to test their knowledge and progress

Background: one teacher and two classes have been added to the database

  Given the following teacher is signed up:
  | name         | school_name  | city         | state | email                | password |
  | Armando Fox  | UC Berkeley  | Berkeley     | CA    | armando@berkeley.edu | password |

  And the following classrooms exists:
  | name      | grade       | teacher       |
  | class a   | 3           | Armando Fox   |
  | class b   | 4           | Armando Fox   |

  And the teacher is signed in

Scenario: generate pre link for "class a"
  Given I am "Armando Fox" looking at "class a"
  Then I should see the link to Pre-Assessment

Scenario: generate post link for "class a"
  Given I am "Armando Fox" looking at "class a"
  Then I should see the link to Post-Assessment