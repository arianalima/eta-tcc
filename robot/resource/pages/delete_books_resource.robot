*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Resource  ../resource.robot


*** Variable ***
${BOOKSTORE_BUTTON}    id=gotoStore
${DELETE_BUTTON_ICON}  id=delete-record-undefined
${CONFIRM_BOOKS_DELETION_BUTTON}  id=closeSmallModal-ok
${CANCEL_BOOKS_DELETION_BUTTON}  id=closeSmallModal-cancel
${DELETE_TOOLTIP}   css=span[data-toggle='tooltip'][title='Delete']      
${NO_ROWS_FOUND_MESSAGE}  css=.rt-noData
${HEADER_TITLE}  css=.main-header
${ADD_A_BOOK_TO_A_COLLECTION_BUTTON}  xpath=//button[text()='Add To Your Collection']


*** Keywords ***
I click to open the book store
    Click Element With Wait Condition ${BOOKSTORE_BUTTON}

I open "${BOOK_NAME}" book
    Click Element With Wait Condition xpath=//a[text()='${BOOK_NAME}']

I add the book to my collection
    Press Keys  None  PAGE_DOWN
    Close Banner
    Click Element With Wait Condition ${ADD_A_BOOK_TO_A_COLLECTION_BUTTON}
    ${message} =	Handle Alert
    Should Be Equal As Strings    ${message}    Book added to your collection.


I return to "${TITLE}" screen
    Click Element With Wait Condition xpath=//span[text()='${TITLE}']
    Wait Until Element Contains  ${HEADER_TITLE}  Profile


I click to delete "${BOOK_NAME}" book
    Click Element With Wait Condition //span[@id='see-book-${BOOK_NAME}']//..//..//..//div[last()]//span[@id='delete-record-undefined']


I confirm the book deletion
    Click Element With Wait Condition ${CONFIRM_BOOKS_DELETION_BUTTON}
    Handle Alert	timeout=4s


I click to cancel the deletion
    Click Element With Wait Condition ${CANCEL_BOOKS_DELETION_BUTTON}


I should not be able to see books in my profile
    Element Should Be Visible  ${NO_ROWS_FOUND_MESSAGE}


I should be able to see "${BOOK_NAME}" book in my profile
    Element Should Be Visible    css=span[id='see-book-${BOOK_NAME}']


I hover on Delete icon
    Wait Until Element Is Visible  ${DELETE_BUTTON_ICON}
    Mouse Over  ${DELETE_BUTTON_ICON}


I should see the tooltip
    Element Should Be Visible  ${DELETE_TOOLTIP}
