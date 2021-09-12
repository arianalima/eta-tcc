*** Settings ***
Library  SeleniumLibrary


*** Variable ***
${LOGIN_MENU}  css=.show>.menu-list>li:nth-child(1)
${LOGIN_BUTTON}  css=#login
${LOGIN_FORM}  css=#userForm
${USERNAME_INPUT}  css=#userName
${PASSWORD_INPUT}  css=#password-wrapper

*** Keywords ***
Open Login Screen
        Wait Until Element Is Visible  ${LOGIN_BUTTON}
        Click Element  ${LOGIN_MENU}
        Wait Until Element Is Visible  ${LOGIN_FORM}
        Page Should Contain  Welcome,
        Page Should Contain  Login in Book Store


the user is redirected to "Profile" screen
        Page Should Contain  Profile


the fields are filled: "${VALID_USER}" and "${VALID_PASSWORD}"
        Input Text  ${USERNAME_INPUT}  ${VALID_USER}
        Input Text  ${PASSWORD_INPUT}  ${VALID_PASSWORD}

the "${BUTTON_TITLE}" button is clicked
        Click Element  ${BUTTON_TITLE}