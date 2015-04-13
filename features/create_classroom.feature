Feature: Create new class
  As a teacher
  I want to be able to add new classes
  So that I can manage multiple classes at once

Background: Teacher exists and has a class with multiple students
  
  Given the following teacher is signed up:
  | name         | school_name  | city         | state | email                | password |
  | Armando Fox  | UC Berkeley  | Berkeley     | CA    | armando@berkeley.edu | password |

  Given the teacher is signed in

Scenario: Create class
  When I am on the teacher dashboard page for "Armando Fox"

  And I create the following class:
  | name         | program       | class_type   |
  | Monday 8AM   | bizworld      | after school |

  Then I should see "Monday 8AM"
  And I should see "after school"


