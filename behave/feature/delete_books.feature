Feature: Delete Books

    Background: SETUP
    Given I access login page
    And I insert my login information 
        |username | password |
        | admin   | Admin1!! |
    When I click in login button
    Then I should be redirected to "Profile" screen

@debug
Scenario: Cancel the deletion of my books in my collection
    Given I click to open the book store
    When I click to add "Git Pocket Guide" book
    Then I verify that the book was added correctly
    When I return to "Profile" screen
    And I click to delete the "Git Pocket Guide" book
    And I click to cancel the deletion
    Then I should be able to see this book below in my profile
        |title           |
        |Git Pocket Guide|

@debug
Scenario: See tooltip delete icon
    Given I hover on Delete icon
    Then I should see the tooltip

@debug
Scenario: Delete one book in my collection
    Given I click to open the book store
    When I click to add "Learning JavaScript Design Patterns" book
    Then I verify that the book was added correctly
    When I return to "Profile" screen
    Given I click to delete the "Git Pocket Guide" book
    And I click to confirm the deletion
    Then I should see a warning informing that the book(s) was deleted    
    And  I should be able to see this book below in my profile
        |title                              |
        |Learning JavaScript Design Patterns|

@debug
Scenario: Delete all book in my collection
    Given I click to delete all books
    And I click to confirm the deletion
    Then I should see a warning informing that all book(s) was deleted 
    And I should not be able to see books in my profile