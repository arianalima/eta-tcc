Feature: Delete Books

    Background: SETUP
    Given I access login page
    And I insert my login information 
        |username | password |
        | admin   | Admin1!! |
    When I click in login button
    Then I should be redirected to "Profile" screen


Scenario: Cancel the deletion of my books in my collection
    Given I click to open the book store
    And I click to add "Git Pocket Guide" book
    And I return to "Profile" screen
    And I click to delete a book
    When I click to cancel the deletion
    Then I should be able to see one book in my profile