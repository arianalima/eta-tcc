Feature: Bookstore


Scenario: Access the Book’s website
    Given I open "Git Pocket Guide" book
    When  I click on its website link
    Then  I should see that a new tab is opened
    And   I should be able to see the website about the selected book

Scenario: Open a Book’s Information on a new tab
    When I open the book "Git Pocket Guide" information on a new tab
    Then I should see that a new tab is opened with "Git Pocket Guide" details

Scenario: Verify the books are correctly displayed after search
    When I search the bookstore for "No Starch"
    Then I verify that only 2 books are displayed per page
    And  The search result should match
        |title                               |author            |publisher       |
        |Eloquent JavaScript, Second Edition |Marijn Haverbeke  |No Starch Press |
        |Understanding ECMAScript 6          |Nicholas C. Zakas |No Starch Press |

Scenario Outline: Sort the books from the books list 
    Given I click on the column <column>
    Then  I should see that the rows are ordered by the selected column <column>
    Examples: Books Information
        |column    |
        |Author    |
        |Publisher |

Scenario: Verify the pagination of the BookStore screen
    Given I select 5 books to be displayed per page 
    Then  I verify that only 5 books are displayed per page
    When  I click on the Next button
    Then  I verify that only 3 books are displayed per page
