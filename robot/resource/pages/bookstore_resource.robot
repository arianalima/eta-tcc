*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  Collections
Library  String

*** Variable ***
${FIRST_BOOK}  css=a[href="/books?book=9781449325862"]
${WEBSITE_LABEL}  css=#website-label
${WEBSITE_LINK}  css=#website-wrapper #userName-value
${CLOSE_BANNER}  css=#close-fixedban
${BACK_BUTTON}  css=#addNewRecordButton
${SEARCH_FIELD}  css=#searchBox
${BOOK_TABLE}   css=.rt-tr-group
${SEARCH_EXPECTED_RESULT_1}  Eloquent JavaScript, Second Edition\nMarijn Haverbeke\nNo Starch Press
${SEARCH_EXPECTED_RESULT_2}  Understanding ECMAScript 6\nNicholas C. Zakas\nNo Starch Press
@{SEARCH_EXPECTED_RESULT_LIST}=  ${SEARCH_EXPECTED_RESULT_1}  ${SEARCH_EXPECTED_RESULT_2}
@{TABLE_HEADER}  css=.rt-th
${ROWS_SELECTOR}  css=.select-wrap>select
${NEXT_PAGE_BUTTON}  css=.-next>button

*** Keywords ***
I click on a book
    Wait Until Element Is Visible  ${FIRST_BOOK}
    Click Element  ${FIRST_BOOK}
    Wait Until Element Is Visible  ${WEBSITE_LABEL}
    Page Should Contain  Git Pocket Guide
    Wait Until Element Is Visible  ${CLOSE_BANNER}
    Click Element  ${CLOSE_BANNER}

I click on its website link
    Scroll Element Into View  ${BACK_BUTTON}
    Click Element  ${WEBSITE_LINK}    

I should see that a new tab is opened
    ${windows}=  Get Window Titles
    ${windows_length}=    Get length    ${windows}
    Should Be True    ${windows_length} > 1
    Should Be Equal As Strings    ${windows}[0]    ToolsQA
    Should Be Equal As Strings    ${windows}[1]    O'Reilly Media - Technology and Business Training    

I should be able to see the information about the selected book
    ${windows}=  Get Window Titles
    Switch Window    ${windows}[1]
    Title Should Be   O'Reilly Media - Technology and Business Training
    Page Should Contain   The learning platform your tech teams need to stay ahead

I click to open the book information on a new tab    
    Wait Until Element Is Visible  ${FIRST_BOOK}
    Click Element  ${FIRST_BOOK}    CTRL
    ${windows}=  Get Window Handles
    Switch Window    ${windows}[1]
    Wait Until Element Is Visible  ${WEBSITE_LABEL}
    Wait Until Element Is Visible  ${CLOSE_BANNER}
    Click Element  ${CLOSE_BANNER}

I should see that a new tab is opened with the Books information
    ${windows}=  Get Window Titles
    ${windows_length}=    Get length    ${windows}
    Should Be True    ${windows_length} > 1
    Page Should Contain  Git Pocket Guide

I search for "${SEARCH_VALUE}"
    Wait Until Element Is Visible  ${SEARCH_FIELD}
    Input Text  ${SEARCH_FIELD}  ${SEARCH_VALUE}

I click on the column "${column_title}"
    Wait Until Element Is Visible  ${TABLE_HEADER}
    @{sections}=  Get WebElements  ${TABLE_HEADER}
    FOR  ${el}  IN  @{sections}
         ${txt}=  Get Text  ${el}
         ${result}=    Run Keyword And Return Status    Should Be Equal As Strings    ${txt}    ${column_title}
         Run Keyword If  ${result}  Click Element  ${el}
         Exit For Loop If  ${result}
    END

I verify that the books returned are displayed in ${n} rows as expected
    ${books_result}=  Check books table result
    Length Should Be  ${books_result}  ${n}
    Lists Should Be Equal  ${books_result}  ${SEARCH_EXPECTED_RESULT_LIST}

I verify that only ${n} books are displayed per page
    ${books_result}=  Check books table result
    Length Should Be  ${books_result}  ${n}

Check books table result
    @{books}=  Get WebElements    ${BOOK_TABLE}
    @{books_result}=  Create List
    FOR    ${el}    IN    @{books}
        ${txt}=    Get Text    ${el}
        ${result}=  Run Keyword And Return Status   Should Not Be Empty  ${txt.strip()}
        Exit For Loop If  '${result}'=='False'
        Append To List  ${books_result}  ${txt}
    END
    [Return]  ${books_result}

I should see that the rows are ordered by the selected column "${column_title}"
    @{books}=  Get WebElements    ${BOOK_TABLE}
    ${index}=  Get "${column_title}" index
    @{actual_content}=  Create List
    FOR    ${el}    IN    @{books}
        ${txt}=    Get Text    ${el}
        ${result}=  Run Keyword And Return Status   Should Not Be Empty  ${txt.strip()}
        Exit For Loop If  '${result}'=='False'
        ${sub}=  Split To Lines  ${txt}
        ${content}=  Get From List  ${sub}  ${index}
        Append To List  ${actual_content}  ${content}
    END
    ${expected_content}=  Copy List  ${actual_content}
    Sort List  ${expected_content}
    Lists Should Be Equal  ${actual_content}  ${expected_content}

Get "${column_title}" index
    @{sections}=  Get WebElements  ${TABLE_HEADER}
    @{header}=  Create List
    FOR    ${el}    IN    @{sections}
        ${txt}=    Get Text    ${el}
        Append To List  ${header}  ${txt}
    END
    ${index}=  Get Index From List  ${header}  ${column_title}
    ${index}=  Evaluate  ${index}-1
    Return From Keyword  ${index}

I select 5 books to be displayed per page
    Press Keys  None  PAGE_DOWN 
    Wait Until Element Is Visible  ${ROWS_SELECTOR}
    @{dropdown}=  Get WebElements  ${ROWS_SELECTOR}
    Select From List By Index  ${dropdown}  0
    Press Keys  None  PAGE_UP

I click on the "Next" button
    Wait Until Element Is Visible  ${NEXT_PAGE_BUTTON}
    Click Element  ${NEXT_PAGE_BUTTON}
