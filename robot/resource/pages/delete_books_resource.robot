*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem


*** Variable ***
${HEADER_TITLE}  css=.main-header
${FIRST_BOOK}  css=a[href="/books?book=9781449325862"]
${ADD_A_BOOK_TO_A_COLLECTION_BUTTON}  xpath=//div[@class='mt-2 fullButtonWrap row']/*[last()]//button 
${CLOSE_BANNER}  css=#close-fixedban
${PROFILE_BUTTON}  xpath=//span[text()='Profile']
${DELETE_BUTTON_ICON}  css=.action-buttons>#delete-record-undefined
${CONFIRM_BOOKS_DELETION_BUTTON}  css=#closeSmallModal-ok
${CANCEL_BOOKS_DELETION_BUTTON}  css=#closeSmallModal-cancel
${BOOK_NAME_LABEL}   xpath=//label[text()='Git Pocket Guide']
${DELETE_TOOLTIP}   css=span[data-toggle='tooltip'][title='Delete']      
${PROFILE_URL}   https://demoqa.com/profile
${BOOKSTORE_URL}    https://demoqa.com/books


*** Keywords ***
I click to open the book store
    Go To  ${BOOKSTORE_URL}
    Wait Until Element Contains  ${HEADER_TITLE}  Book Store


I click to add a book
    Wait Until Element Is Visible  ${FIRST_BOOK}
    Click Element  ${FIRST_BOOK}
    Wait Until Element Contains  ${BOOK_NAME_LABEL}  Git Pocket Guide
    Press Keys  None  PAGE_DOWN  
    Wait Until Element Is Visible  ${CLOSE_BANNER}
    Click Element  ${CLOSE_BANNER}
    Wait Until Element Is Visible  ${ADD_A_BOOK_TO_A_COLLECTION_BUTTON}
    Click Element  ${ADD_A_BOOK_TO_A_COLLECTION_BUTTON}
    ${message} =	Handle Alert
    Should Be Equal As Strings    ${message}    Book added to your collection.


I return to "Profile" screen
    Go To  ${PROFILE_URL}
    Wait Until Element Contains  ${HEADER_TITLE}  Profile


I click in "Profile" button
    Wait Until Element Is Visible  ${CLOSE_BANNER}
    Click Element  ${CLOSE_BANNER}
    Wait Until Element Is Visible  ${PROFILE_BUTTON}
    Click Element  ${PROFILE_BUTTON}


I click to delete a book
    Wait Until Element Is Visible  ${DELETE_BUTTON_ICON}
    Click Element  ${DELETE_BUTTON_ICON}


I confirm the book deletion
    Wait Until Element Is Visible  ${CONFIRM_BOOKS_DELETION_BUTTON}
    Click Element  ${CONFIRM_BOOKS_DELETION_BUTTON}
    Handle Alert	timeout=4s


I click to cancel the deletion
    Wait Until Element Is Visible  ${CANCEL_BOOKS_DELETION_BUTTON}
    Click Element  ${CANCEL_BOOKS_DELETION_BUTTON}


I should not be able to see books in my profile
    Element Should Not Be Visible  ${DELETE_BUTTON_ICON}


I should be able to see one book in my profile
    Element Should Be Visible  ${DELETE_BUTTON_ICON}


I hover on Delete icon
    Mouse Over  ${DELETE_BUTTON_ICON}


I should see the tooltip
    Element Should Be Visible  ${DELETE_TOOLTIP}
