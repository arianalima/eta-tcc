*** Settings ****
Resource          ../resource/resource.robot
Resource          ../resource/pages/bookstore_resource.robot
Test Setup       Open Application
Test Teardown    Close Application


*** Variables ***
${SEARCH_VALUE}  No Starch
${RESULTS_COUNT}  2


*** Keywords ***
Sort the books from the books list 
    [Arguments]  ${column_title}
    When I click on the column "${column_title}"
    Then I should see that the rows are ordered by the selected column "${column_title}"


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
    When I search for "${SEARCH_VALUE}"
    Then I verify that the books returned are displayed in ${RESULTS_COUNT} rows as expected

| *Test Case*           |  *Keyword*                            | *Sort Column*        |
| Scenario Outline 04.1 | Sort the books from the books list    | Author               |
| Scenario Outline 04.2 | Sort the books from the books list    | Publisher            |

***comment***
Scenario 05: Verify the pagination of the BookStore screen
    Given I select 5 books to be displayed per page 
    Then I verify that only 5 books are displayed per page
    When I click on the [Next] button
    Then I should be able to see the other books from the list

