*** Settings ****
Resource          ../resource/resource.robot
Resource          ../resource/BDD.robot
Resource          ../resource/pages/delete_books_resource.robot
Resource          ../resource/pages/login_resource.robot
Test Setup       Open Application
Test Teardown    Close Application
#Suite Teardown    Delete all books


*** Variables ***
${VALID_USER}  admin
${VALID_PASSWORD}  Admin1!!


*** Test Cases ***

Scenario 01: Cancel the deletion of my books in my collection
    Given Open Login Screen
    And the fields are filled: "${VALID_USER}" and "${VALID_PASSWORD}"
    When the "Login" button is clicked
    Then the user is redirected to "Profile" screen
    When I click to open the book store
    And I click to add a book
    And I return to "Profile" screen
    And I click to delete a book
    And I click to cancel the deletion
    Then I should be able to see one book in my profile
    #tear down
    And Delete all Books
    And Logout

Scenario 02: See tooltip delete icon
    Given Open Login Screen
    And the fields are filled: "${VALID_USER}" and "${VALID_PASSWORD}"
    When the "Login" button is clicked
    Then the user is redirected to "Profile" screen
    When I click to open the book store
    And I click to add a book
    And I return to "Profile" screen
    And I hover on Delete icon
    Then I should see the tooltip
    #tear down
    And Delete all books
    And Logout


Scenario 03: Delete one book in my collection
    Given Open Login Screen
    And the fields are filled: "${VALID_USER}" and "${VALID_PASSWORD}"
    When the "Login" button is clicked
    Then the user is redirected to "Profile" screen
    When I click to open the book store
    And I click to add a book
    And I return to "Profile" screen
    And I click to delete a book
    And I confirm the book deletion
    Then I should not be able to see books in my profile
    And Logout
