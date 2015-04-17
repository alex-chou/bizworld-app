Feature: View class roster
  As a teacher
  I want to be able to view student information on my dashboard
  So that I see my class roster

Background: Teacher exists and has a class with multiple students
  
  Given the following teacher is signed up:
  | name         | school_name  | city         | state | email                | password |
  | Armando Fox  | UC Berkeley  | Berkeley     | CA    | armando@berkeley.edu | password |

  And the following classrooms belong to the teacher:
  | name       | program     | class_type   | start_date | end_date  |
  | Monday 8AM | Bizworld    | After School | 1-1-2015   | 1-10-2015 |

  And the following students belong to the classroom:
  | first_name  | last_name | age         | gender       | ethnicity  | pre_score | post_score |
  | Billy       | Bob       | 9           | male         | Indian     | 50%       | 75%        |
  | Ashley      | Le        | 8           | female       | Asian      | 60%       | 80%        |

  Given the teacher is signed in
  Given I am "Armando Fox" looking at "Monday 8AM"

Scenario: View student names
  Then "Billy Bob" should be on the class roster
  And "Ashley Le" should be on the class roster

Scenario: A teacher should be able to upload a class roster using an excel sheet
  Given that I am a teacher
  Then I want to be able to upload an excel file of student data
  And I can easily populate my student roster
