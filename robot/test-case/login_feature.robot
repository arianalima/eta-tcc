*** Settings ***
Resource          ../resource/resource.robot
Resource          ../resource/BDD.robot
Resource          ../resource/pages/login_resource.robot
Suite Setup       Open Application
Test Setup        Open Login Screen
#Suite Teardown    Close Application

#Bookstore Application sign in and sign up scenarios

*** Variables ***
${VALID_USER}  admin
${VALID_PASSWORD}  Admin1!!


*** Test Cases ***
Scenario 01: User successfully logged in
    Given the fields are filled: "${VALID_USER}" and "${VALID_PASSWORD}"
    When the "Login" button is clicked
    Then the user is redirected to "Profile" screen


*** comment ***
Scenario Outline 02: Login error due to invalid fields
    Given the fields are filled:
    | UserName   | Password   |
    | <user> | <password> |
    When the "Login" button is clicked    
    The "Invalid username or password!" message is shown
    Examples:
        | user        | password        |
        | invalidUser | validPassword   |
        | validUser   | invalidPassword |

Scenario 03: New user successfully created
    When  the "New User" button is clicked
    Then  the user is redirected to "Register to Book Store" screen
    Given the fields are filled:
    | First Name | Last Name | UserName | Password      |
    | Dummy      | Dummy     | newUser  | validPassword |
    And   the reCaptcha is marked
    When  the "Register" button is clicked
    Then  "User Register Successfully." alert message is shown
    When  the alert confirmation button is clicked
    Then  the alert is closed

Scenario 04: Sign up error due to empty fields
    When  the "New User" button is clicked
    Then  the user is redirected to "Register to Book Store" screen
    Given the fields are blank:
    | First Name | Last Name | UserName  | Password |
    And   the reCaptcha is marked
    When  the "Register" button is clicked
    Then the blank fields get a red alert (with "Preencha este campo" tooltip)

Scenario 05: Sign up error due to invalid captcha
    When  the "New User" button is clicked
    Then  the user is redirected to "Register to Book Store" screen
    Given the fields are filled:
    | First Name | Last Name | UserName | Password      |
    | Dummy      | Dummy     | newUser  | validPassword |
    And   the reCaptcha is not marked
    When  the "Register" button is clicked
    Then  "Please verify reCaptcha to register!" message is shown
