*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem


*** Variable ***
${BROWSER}    chrome
${URL}        https://demoqa.com/


*** Keywords ***    

Open Application
    Set Environment Variable  webdriver.chrome.driver  ../chromedriver.exe
    Open Browser  ${URL} ${BROWSER}


Close Browser
    Capture Page Screenshot
    Close Browser