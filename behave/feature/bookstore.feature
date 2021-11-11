Feature: Bookstore


@bookstore
Scenario: Access the Book’s website
    Given I select the "Git Pocket Guide" book
    When  I click on its website link
    Then  I should be able to see the tabs information as displayed below
        |title                                             |url                                         |
        |ToolsQA                                           |https://demoqa.com/books?book=9781449325862 |
        |O'Reilly Media - Technology and Business Training |https://www.oreilly.com/                    |


@bookstore
Scenario: Open a Book’s Information on a new tab
    Given I select to open the book "Git Pocket Guide" information on a new tab
    Then  I should be able to see the tabs information as displayed below
        |title        |url                                         |
        |ToolsQA      |https://demoqa.com/books                    |
        |ToolsQA      |https://demoqa.com/books?book=9781449325862 |
    And   I should see that a new tab is opened with the Books information as displayed below
        |ISBN          |title            |author               |publisher      |
        |9781449325862 |Git Pocket Guide |Richard E. Silverman |O'Reilly Media |


@bookstore
Scenario: Verify the books are correctly displayed after search
    Given I search the bookstore for "No Starch"
    Then  I verify that the books returned are displayed in rows as below
        |title                               |author            |publisher       |
        |Eloquent JavaScript, Second Edition |Marijn Haverbeke  |No Starch Press |
        |Understanding ECMAScript 6          |Nicholas C. Zakas |No Starch Press |


@bookstore
Scenario Outline: Sort the books from the books list 
    Given I click to sort by the column <column>
    Then  I should see that the rows are ordered by the selected column <column>
        
    Examples: Books Information
        |column    |
        |Author    |
        |Publisher |


@bookstore
Scenario: Verify the pagination of the BookStore screen
    Given I select 5 books to be displayed per page 
    Then  I verify that only 5 books are displayed per page
    When  I click on the Next button
    Then  I verify that only 3 books are displayed per page
