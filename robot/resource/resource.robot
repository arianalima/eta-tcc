*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Resource  ./pages/login_resource.robot


*** Variable ***
${BROWSER}    chrome
${URL}        https://demoqa.com/
${BOOKSTORE_CARD}  css=.category-cards > div:nth-child(6)
${CLOSE_BANNER}  css=#close-fixedban
${VALID_USER}  admin
${VALID_PASSWORD}  Admin1!!
${PROFILE_BUTTON}  xpath=//span[text()='Profile']
${DELETE_ALL_BOOKS_BUTTON}  css=.di>#submit
${LOGOUT_BUTTON}   xpath=//button[text()='Log out']
${CONFIRM_BOOKS_DELETION_BUTTON}  css=#closeSmallModal-ok


*** Keywords ***    
Open Application
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Close Banner
    Press Keys  None  PAGE_DOWN 
    Click Element With Wait Condition ${BOOKSTORE_CARD}

Login into Application
    Open Login Screen
    the user is redirected to "Profile" screen        
    the fields are filled: "${VALID_USER}" and "${VALID_PASSWORD}"
    the "Login" button is clicked

Close Application
    Close Browser


Delete all books
    Close Banner
    Click Element With Wait Condition ${DELETE_ALL_BOOKS_BUTTON}
    Click Element With Wait Condition ${CONFIRM_BOOKS_DELETION_BUTTON}
    Handle Alert	timeout=40s


Login
    Open Login Screen
    Given the fields are filled: "${VALID_USER}" and "${VALID_PASSWORD}"
    And the "Login" button is clicked
    And the user is redirected to "Profile" screen


Logout
    Click Element With Wait Condition ${LOGOUT_BUTTON}


Close Banner
    ${passed} =  Run Keyword And Return Status   Wait Until Element Is Visible  ${CLOSE_BANNER}
    Run Keyword If 	${passed}  Click Element  ${CLOSE_BANNER}


Click Element With Wait Condition ${ELEMENT_LOCATOR}
    Wait Until Element Is Visible  ${ELEMENT_LOCATOR}  15
    Click Element  ${ELEMENT_LOCATOR}
