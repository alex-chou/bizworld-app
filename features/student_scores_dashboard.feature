Feature: View student scores
  As a teacher
  I want to able to view all my students' scores on my dashboard
  So that I can compare their scores as a class

Background: Teacher exists and has a class with multiple students
  
  Given the following teacher exists:
  | name         | school_name  | city         | state | email          | username  |
  | Armando Fox  | UC Berkeley  | Berkeley     | CA    | armando@berkeley.edu | Armando   |

  And the following classrooms belong to the teacher:
  | name       | program     | class_type   | start_date | end_date  |
  | Monday 8AM | Bizworld    | After School | 1-1-2015   | 1-10-2015 |

  And the following students belong to the classroom:
  | name       | age         | gender       | ethnicity  | pre-score | post-score |
  | Billy Bob  | 9           | male         | Indian     | 50%       | 75%        |
  | Ashley Le  | 8           | female       | Asian      | 60%       | 80%        |

  When I am on the teacher dashboard page

Scenario: View student scores
  Then "Billy Bob" should have a pre-score of 50% and a post-score of 75%
  And "Ashley Le" should have a pre-score of 60% and a post-score of 80%