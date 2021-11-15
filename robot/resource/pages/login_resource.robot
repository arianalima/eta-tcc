*** Settings ***
Resource  ../resource.robot
Library  SeleniumLibrary


*** Variable ***
${LOGIN_MENU}  css=.show>.menu-list>li:nth-child(1)
${LOGIN_BUTTON}  id=login
${LOGIN_FORM}  id=userForm
${USERNAME_INPUT}  id=userName
${PASSWORD_INPUT}  id=password
${HEADER_TITLE}  css=.main-header

*** Keywords ***
Open Login Screen
        Press Keys  None  PAGE_DOWN
        Click Element With Wait Condition ${LOGIN_MENU}
        Wait Until Element Is Visible  ${LOGIN_FORM}
        Page Should Contain  Welcome,
        Page Should Contain  Login in Book Store

the user is redirected to "Profile" screen
        Wait Until Element Contains  ${HEADER_TITLE}  Profile

the fields are filled: "${VALID_USER}" and "${VALID_PASSWORD}"
        Input Text  ${USERNAME_INPUT}  ${VALID_USER}
        Input Text  ${PASSWORD_INPUT}  ${VALID_PASSWORD}

the "Login" button is clicked
        Click Element  ${LOGIN_BUTTON}