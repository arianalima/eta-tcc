*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem


*** Variable ***
${BROWSER}    chrome
${URL}        https://demoqa.com/
${BOOKSTORE_CARD}  css=.category-cards > div:nth-child(6)
${CLOSE_BANNER}  css=#close-fixedban
${HEADER_TITLE}  css=.main-header
${VALID_USER}  admin
${VALID_PASSWORD}  Admin1!!


*** Keywords ***    
Open Application
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Title Should Be  ToolsQA
    Wait Until Element Is Visible  ${CLOSE_BANNER}
    Click Element  ${CLOSE_BANNER}
    Press Keys  None  PAGE_DOWN 
    Wait Until Element Is Visible  ${BOOKSTORE_CARD}
    Click Element  ${BOOKSTORE_CARD}
    Element Text Should Be  ${HEADER_TITLE}  Book Store

Login into Application
    Open Login Screen
    the user is redirected to "Profile" screen        
    the fields are filled: "${VALID_USER}" and "${VALID_PASSWORD}"
    the "Login" button is clicked

Close Application
    Close Browser