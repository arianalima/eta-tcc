*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Resource  ./BDD.robot
Resource  ./pages/login_resource.robot


*** Variable ***
${BROWSER}    chrome
${URL}        https://demoqa.com/
${BOOKSTORE_CARD}  css=.category-cards > div:nth-child(6)
${CLOSE_BANNER}  css=#close-fixedban
${HEADER_TITLE}  css=.main-header
${PROFILE_BUTTON}  xpath=//span[text()='Profile']
${DELETE_ALL_BOOKS_BUTTON}  xpath=//button[text()='Delete All Books']
${LOGOUT_BUTTON}   xpath=//button[text()='Log out']
${CONFIRM_BOOKS_DELETION_BUTTON}  css=#closeSmallModal-ok


*** Keywords ***    
Open Application
   # Set Environment Variable  webdriver.chrome.driver  ..\chromedriver.exe
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Title Should Be  ToolsQA
    Wait Until Element Is Visible  ${CLOSE_BANNER}
    Click Element  ${CLOSE_BANNER}
    Press Keys  None  PAGE_DOWN 
    Wait Until Element Is Visible  ${BOOKSTORE_CARD}
    Click Element  ${BOOKSTORE_CARD}
    Element Text Should Be  ${HEADER_TITLE}  Book Store


Close Application
    Close Browser


Delete all books
    Wait Until Element Is Visible  ${DELETE_ALL_BOOKS_BUTTON}
    Click Element  ${DELETE_ALL_BOOKS_BUTTON}
    Wait Until Element Is Visible  ${CONFIRM_BOOKS_DELETION_BUTTON}
    Click Element  ${CONFIRM_BOOKS_DELETION_BUTTON}
    Handle Alert	timeout=40s


Login
    Open Login Screen
    Given the fields are filled: "${VALID_USER}" and "${VALID_PASSWORD}"
    And the "Login" button is clicked
    And the user is redirected to "Profile" screen


Logout
    Wait Until Element Is Visible  ${LOGOUT_BUTTON}
    Click Element  ${LOGOUT_BUTTON}
