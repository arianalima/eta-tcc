Feature: Delete Books

    Background: SETUP
    Given the user is logged in


    @delete_all @logout
    Scenario: Cancel the deletion of my books in my collection
        Given I click to open the book store
        And I open "Git Pocket Guide" book
        And I add the book to my collection
        And I return to "Profile" screen
        And I click to delete the "Git Pocket Guide" book
        When I click to cancel the deletion
        Then I should be able to see "Git Pocket Guide" book in my profile


    @delete_all @logout
    Scenario: See tooltip delete icon
        Given I click to open the book store
        And I open "Git Pocket Guide" book
        And I add the book to my collection
        And I return to "Profile" screen
        When I hover on Delete icon
        Then I should see the tooltip


    @logout
    Scenario: Delete one book in my collection
        Given I click to open the book store
        And I open "Git Pocket Guide" book
        And I add the book to my collection
        And I return to "Profile" screen
        When I click to delete the "Git Pocket Guide" book
        And I click to confirm the deletion
        Then I should not be able to see books in my profile
