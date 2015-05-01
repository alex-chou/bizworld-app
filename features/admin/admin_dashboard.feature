Feature: View teachers on the dashboard
As an admin
I want to have special access
So that i can see all teachers and their dashboards

Background: Teacher exists and has multiple classes

  Given the following teacher is signed up:
  | name         | school_name  | city         | state | email				        | username	| password |
  | Armando Fox  | UC Berkeley  | Berkeley     | CA    | armando@berkeley.edu | Armando 	| password |

  And the following classrooms belong to the teacher:
  | name       | program     | class_type   | start_date | end_date	 |
  | Monday 8AM | Bizworld    | After School | 1-1-2015   | 1-10-2015 |

  And the admin is logged in

Scenario: View all teachers
	When I am on the admin dashboard page 
	Then I should see "Armando Fox"

Scenario: View individual teacher dashboard
  When I am on the admin dashboard page
  And I follow "Armando Fox"
  Then I am on the teacher dashboard page for "Armando Fox"

Scenario: View edit admin page
  When I am on the admin dashboard page
  And I follow "Edit Admins"
  Then I am on the edit admin page

Scenario: Edit other user's admin settings
  When I am on the edit admin page
  And I check "edit_admin_1"
  And I press "edit_admin_submit"
  Then I am on the admin dashboard page
  And "Armando Fox" should be an admin


Scenario: Not admin
  When I logout
  And I am not the admin
  Then I should not see "Teachers"
