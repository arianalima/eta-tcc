*** Settings ****
Resource        ../robot/resource/resource.robot
Resource        ../robot/resource/BDD.robot
Resource        ../robot/resource/pages/bookstore_resource.robot
Suite Setup     Books Deletion Setup

*** Test Cases ***
Scenario 01: Access the Book’s website
    Given I click on a book
    When I click on its website link
    Then I should see that a new tab is opened
    And I should be able to see the information about the selected book

Scenario 02: Open a Book’s Information on a new tab
    When I click to open the book information on a new tab
    Then I should see that a new tab is opened with the Books information

Scenario 03: Verify the books are displayed in rows
    When I search for “No Starch”
    Then I verify that the books are displayed in rows as the table below
        |Title                               |Author              |Publisher        |
        |Eloquent JavaScript, Second Edition |Marijn Haverbeke    |No Starch Press  |
        |Understanding ECMAScript 6          |Nicholas C. Zakas   |No Starch Press  |

Scenario Outline 04: Sort the books from the books list 
    When I click on the column <column>
    Then I should see that the rows are ordered by the selected column
        |column   |
        |Title    |
        |Author   |
        |Publisher

Scenario 05: Verify the pagination of the BookStore screen
    Given I select 5 books to be displayed per page 
    Then I verify that only 5 books are displayed per page
    When I click on the [Next] button
    Then I should be able to see the other books from the list
