Feature: authentication

  As a user who is not logged in
  I should not be able to access any pages
  And should be redirected to a login page

Scenario: redirect a user that is not logged in
  Given that I am not logged in
  Then any link I visit should redirect me to the login page
