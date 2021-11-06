*** Settings ****
Resource          ../resource/resource.robot
Resource          ../resource/pages/delete_books_resource.robot
Test Setup        Run Keywords    Open Application    Login
Test Teardown     Run Keywords    Delete all Books    Logout    Close Application


*** Variables ***
${VALID_USER}  admin
${VALID_PASSWORD}  Admin1!!


*** Test Cases ***
Scenario 01: Cancel the deletion of my books in my collection
    Given I click to open the book store
    And I click to add a book
    And I return to "Profile" screen
    And I click to delete a book
    When I click to cancel the deletion
    Then I should be able to see one book in my profile


Scenario 02: See tooltip delete icon
    Given I click to open the book store
    And I click to add a book
    And I return to "Profile" screen
    When I hover on Delete icon
    Then I should see the tooltip


Scenario 03: Delete one book in my collection
    Given I click to open the book store
    And I click to add a book
    And I return to "Profile" screen
    When I click to delete a book
    And I confirm the book deletion
    Then I should not be able to see books in my profile
    [Teardown]  Run Keywords  Logout  Close Application
