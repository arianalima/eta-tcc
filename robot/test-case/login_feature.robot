*** Settings ***
Resource          ../resource/resource.robot
Resource          ../resource/pages/login_resource.robot
Test Setup        Run Keywords    Open Application    Open Login Screen
Test Teardown     Close Application


*** Variables ***
${VALID_USER}  admin
${VALID_PASSWORD}  Admin1!!


*** Test Cases ***
Scenario: User successfully logged in
    Given the fields are filled: "${VALID_USER}" and "${VALID_PASSWORD}"
    When the "Login" button is clicked
    Then the user is redirected to "Profile" screen
    Logout
