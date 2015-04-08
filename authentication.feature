Scenario: redirect a user that is not logged in
  Given that I am not logged in
  Then any link I visit should redirect me to the login page
