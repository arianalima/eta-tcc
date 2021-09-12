*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem


*** Variable ***
${BROWSER}    chrome
${URL}        https://demoqa.com/
${BOOKSTORE_CARD}  css=.category-cards > div:nth-child(6)
${CLOSE_BANNER}  css=#close-fixedban


*** Keywords ***    
Open Application
   # Set Environment Variable  webdriver.chrome.driver  ..\chromedriver.exe
    Open Browser  ${URL}  ${BROWSER}
    Title Should Be  ToolsQA
    Wait Until Element Is Visible  ${CLOSE_BANNER}
    Click Element  ${CLOSE_BANNER}
    Execute Javascipt  window.scrollTo(0, window.scrollY+1000)
    Scroll Element Into View  ${BOOKSTORE_CARD}
    Click Element  ${BOOKSTORE_CARD}
    Page Should Contain  Book Store


Close Application
    Close Browser