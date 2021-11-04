*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem


*** Variable ***
${FIRST_BOOK}  css=a[href="/books?book=9781449325862"]
${WEBSITE_LABEL}  css=#website-label
${WEBSITE_LINK}  css=#website-wrapper #userName-value
${CLOSE_BANNER}  css=#close-fixedban
${BACK_BUTTON}  css=#addNewRecordButton
${SEARCH_FIELD}  css=#searchBox
${SEARCH_RESULT_TABLE}  css=.rt-tr-group:nth-child() .rt-td:nth-child()
&{SEARCH_EXPECTED_RESULT_1}  Title=Eloquent JavaScript, Second Edition    Author=Marijn Haverbeke    Publisher=No Starch Press
&{SEARCH_EXPECTED_RESULT_2}  Title=Understanding ECMAScript 6    Author=Nicholas C. Zakas    Publisher=No Starch Press
@{SEARCH_EXPECTED_RESULT_LIST}  &{SEARCH_EXPECTED_RESULT_1}    &{SEARCH_EXPECTED_RESULT_2}


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
    Log To Console    ${windows}
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

I verify that the books returned are displayed in rows as expected
    FOR    ${RESULT_LINE}    IN    @{SEARCH_EXPECTED_RESULT_LIST}
        Log To Console    ${RESULT_LINE}
        # FOR    ${key}    IN    ${RESULT_LINE}
        #     Log To Console    ${key}
        # END
    END
