*** Settings ****
Resource        ../robot/resource/resource.robot
Resource        ../robot/resource/BDD.robot
Resource        ../robot/resource/pages/delete_books_resource.robot
Suite Setup     Books Deletion Setup

*** Test Cases ***
Scenario 01: Delete all books in my collection
    Given I click in Profile screen
    When I click in “Delete all books” button
    Then I should be able to see a confirmation warning
    When I click to confirm the delete action
    Then I should be able to see a warning informing that the book was deleted
    And I should be able to see 0 books added in my collection

Scenario 02: Cancel the deletion of all books in my collection
    Given I click in Profile screen
    When I click in “Delete all books” button
    Then I should be able to see a confirmation warning
    When I click to cancel the delete action
    Then I should be able to see 3 books added in my collection

Scenario 03: See tooltip delete icon
    Given I click in Profile screen
    When I hover on Delete icon
    Then I should see the tooltip

Scenario 04: Delete one book in my collection
    Given I click in Profile screen
    When I click in the Delete icon
    Then I should be able to see a confirmation warning
    When I click to confirm the delete action
    Then I should be able to see a warning informing that the book was deleted
    And I should be able to see 2 books added in my collection

Scenario 05: Cancel the deletion of one book in my collection
    Given I click in Profile screen
    When I click in the Delete icon
    Then I should be able to see a confirmation warning
    When I click to cancel the delete action
    Then I should be able to see 3 books added in my collection
