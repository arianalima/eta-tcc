*** Settings ***
Library  SeleniumLibrary


*** Variable ***
${BROWSER}    chrome


*** Keywords ***

the fields are filled: "${VALID_USER}" and "${VALID_PASSWORD}"
        Open Browser    url:    ${BROWSER}


Fechar navegador
        Capture Page Screenshot
        Close Browser