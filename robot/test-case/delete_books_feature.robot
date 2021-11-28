*** Settings ***
Resource          ../resource/resource.robot
Resource          ../resource/pages/delete_books_resource.robot
Test Setup        Run Keywords    Open Application    Login
Test Teardown     Run Keywords    Delete all Books    Logout    Close Application


*** Test Cases ***
Scenario: Cancel the deletion of my books in my collection
    Given I click to open the book store
    And I open "Git Pocket Guide" book
    And I add the book to my collection
    And I return to "Profile" screen
    And I click to delete "Git Pocket Guide" book
    When I click to cancel the deletion
    Then I should be able to see "Git Pocket Guide" book in my profile

Scenario: See tooltip delete icon
    Given I click to open the book store
    And I open "Git Pocket Guide" book
    And I add the book to my collection
    And I return to "Profile" screen
    When I hover on Delete icon
    Then I should see the tooltip

Scenario: Delete one book in my collection
    Given I click to open the book store
    And I open "Git Pocket Guide" book
    And I add the book to my collection
    And I return to "Profile" screen
    When I click to delete "Git Pocket Guide" book
    And I confirm the book deletion
    Then I should not be able to see books in my profile
    [Teardown]  Run Keywords  Logout  Close Application
