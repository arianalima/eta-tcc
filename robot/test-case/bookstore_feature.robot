*** Settings ****
Resource          ../resource/resource.robot
Resource          ../resource/pages/bookstore_resource.robot
Resource          ../resource/pages/delete_books_resource.robot
Test Setup       Open Application
Test Teardown    Close Application


*** Variables ***
${SEARCH_VALUE}  No Starch
${RESULTS_COUNT}  2
@{TITLES}=      Eloquent JavaScript, Second Edition    Understanding ECMAScript 6 
@{AUTHORS}=     Marijn Haverbeke                       Nicholas C. Zakas
@{PUBLISHERS}=  No Starch Press                        No Starch Press 
&{EXPECTED_SEARCH_RESULT}=  title=${TITLES}  author=${AUTHORS}  publisher=${PUBLISHERS}


*** Keywords ***
Sort the books from the books list 
    [Arguments]  ${column_title}
    When I click on the column "${column_title}"
    Then I should see that the rows are ordered by the selected column "${column_title}"
 

*** Test Cases ***
Scenario: Access the Book’s website
    Given I open "Git Pocket Guide" book
    When I click on its website link
    Then I should see that a new tab is opened
    And I should be able to see the website about the selected book

Scenario: Open a Book’s Information on a new tab
    When I open the book "Git Pocket Guide" information on a new tab
    Then I should see that a new tab is opened with "Git Pocket Guide" details

Scenario: Verify the books are correctly displayed after search
    When I search the bookstore for "${SEARCH_VALUE}"
    Then I verify that only "${RESULTS_COUNT}" books are displayed per page
    And The search result should match ${EXPECTED_SEARCH_RESULT}

| *Test Case*        |  *Keyword*                            | *Sort Column*        |
| Scenario Outline 1 | Sort the books from the books list    | Author               |
| Scenario Outline 2 | Sort the books from the books list    | Publisher            |

Scenario: Verify the pagination of the BookStore screen
    Given I select "5" books to be displayed per page 
    Then I verify that only "5" books are displayed per page
    When I click on the "Next" button
    Then I verify that only "3" books are displayed per page
