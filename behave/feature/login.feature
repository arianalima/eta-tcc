Feature: Login

  Background: SETUP
    Given The Login screen is opened

  @logout
  Scenario: User successfully logged in
    Given the fields are filled: "admin" and "Admin1!!"
    When the "Login" button is clicked
    Then the user is redirected to "Profile" screen
