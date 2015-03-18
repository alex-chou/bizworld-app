Feature: View class roster
  As a teacher
  I want to be able to view student information on my dashboard
  So that I see my class roster

Background: Teacher exists and has a class with multiple students
  
  Given the following teacher exists:
  | name         | school_name  | city         | state | email          | username  |
  | Armando Fox  | UC Berkeley  | Berkeley     | CA    | armando@berkeley.edu | Armando   |

  And the following classrooms belong to the teacher:
  | name       | program     | class_type   | start_date | end_date  |
  | Monday 8AM | Bizworld    | After School | 1-1-2015   | 1-10-2015 |

  And the following students belong to the classroom:
  | name       | age         | gender       | ethnicity  |
  | Billy Bob  | 9           | male         | Indian     |
  | Ashley Le  | 8           | female       | Asian      |

  When I am on the teacher dashboard page

Scenario: View student names
  Then I should see the students "Billy Bob" and "Ashley Le"


