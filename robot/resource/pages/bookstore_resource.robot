*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  Collections
Library  String
Resource  ../resource.robot

*** Variable ***
${WEBSITE_LABEL}  id=website-label
${WEBSITE_LINK}  css=#website-wrapper #userName-value
${SEARCH_FIELD}  id=searchBox
${BOOK_TABLE}   css=.rt-tr-group
@{TABLE_HEADER}  css=.rt-th
${ROWS_SELECTOR}  css=.select-wrap>select
${NEXT_PAGE_BUTTON}  css=.-next>button

*** Keywords ***
I click on its website link
    Close Banner
    Scroll Element Into View  ${WEBSITE_LINK}
    Click Element  ${WEBSITE_LINK}    

I should see that a new tab is opened
    ${windows}=  Get Window Titles
    ${windows_length}=    Get length    ${windows}
    Should Be True    ${windows_length} == 2
    Should Be Equal As Strings    ${windows}[0]    ToolsQA
    Set Test Variable  ${OPENED_TAB}  ${windows}[1]

I should be able to see the website about the selected book
    Should Be Equal As Strings    ${OPENED_TAB}    O'Reilly Media - Technology and Business Training

I open the book "${BOOK_NAME}" information on a new tab
    Wait Until Element Is Enabled    xpath=//a[text()='${BOOK_NAME}']  15
    Click Element    xpath=//a[text()='${BOOK_NAME}']    CTRL
    ${windows}=  Get Window Handles
    Switch Window    ${windows}[1]
    Wait Until Element Is Visible  ${WEBSITE_LABEL}  15
    Close Banner

I should see that a new tab is opened with "${BOOK_NAME}" details
    ${windows}=  Get Window Titles
    ${windows_length}=    Get length    ${windows}
    Should Be True    ${windows_length} == 2
    Page Should Contain  ${BOOK_NAME}

I search the bookstore for "${SEARCH_VALUE}"
    Wait Until Element Is Visible  ${SEARCH_FIELD}  15
    Input Text  ${SEARCH_FIELD}  ${SEARCH_VALUE}

I click on the column "${column_title}"
    Wait Until Element Is Visible  ${TABLE_HEADER}  15
    @{sections}=  Get WebElements  ${TABLE_HEADER}
    FOR  ${el}  IN  @{sections}
         ${txt}=  Get Text  ${el}
         ${result}=    Run Keyword And Return Status    Should Be Equal As Strings    ${txt}    ${column_title}
         Run Keyword If  ${result}  Click Element  ${el}
         Exit For Loop If  ${result}
    END

I verify that only "${n}" books are displayed per page
    ${books_result}=  Check books table result
    Length Should Be  ${books_result}  ${n}

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

I select "${n}" books to be displayed per page
    Press Keys  None  PAGE_DOWN 
    Wait Until Element Is Visible  ${ROWS_SELECTOR}  15
    @{dropdown}=  Get WebElements  ${ROWS_SELECTOR}
    Select From List By Label  ${dropdown}  ${n} rows
    Press Keys  None  PAGE_UP

I click on the "Next" button
    Click Element With Wait Condition ${NEXT_PAGE_BUTTON}

Check books table result
    @{books}=  Get WebElements    ${BOOK_TABLE}
    @{books_result}=  Create List
    @{titles}=  Create List
    @{authors}=  Create List
    @{publishers}=  Create List
    FOR    ${el}    IN    @{books}
        ${txt}=    Get Text    ${el}
        ${result}=  Run Keyword And Return Status   Should Not Be Empty  ${txt.strip()}
        Exit For Loop If  '${result}'=='False'
        ${sections}=  Split To Lines  ${txt}
        Append To List  ${books_result}  ${sections}
    END
    [Return]  ${books_result}

The search result should match ${expected}
    ${actual}=  Check books table result
    ${limit}=  Get Length  ${actual}
    FOR  ${index}  IN RANGE  0  ${limit}
        Should Be Equal As Strings  ${actual[${index}][0]}    ${expected['title'][${index}]}
        Should Be Equal As Strings  ${actual[${index}][1]}    ${expected['author'][${index}]}
        Should Be Equal As Strings  ${actual[${index}][2]}    ${expected['publisher'][${index}]}
    END
