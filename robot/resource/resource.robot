*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem


*** Variable ***
${BROWSER}    chrome
${URL}        https://demoqa.com/
${BOOKSTORE_CARD}  css=.category-cards > div:nth-child(6)
${CLOSE_BANNER}  css=#close-fixedban
${HEADER_TITLE}  css=.main-header


*** Keywords ***    
Open Application
   # Set Environment Variable  webdriver.chrome.driver  ..\chromedriver.exe
    Open Browser  ${URL}  ${BROWSER}
    Title Should Be  ToolsQA
    Wait Until Element Is Visible  ${CLOSE_BANNER}
    Click Element  ${CLOSE_BANNER}
    Press Keys  None  PAGE_DOWN 
    Wait Until Element Is Visible  ${BOOKSTORE_CARD}
    Click Element  ${BOOKSTORE_CARD}
    Element Text Should Be  ${HEADER_TITLE}  Book Store


Close Application
    Close Browser