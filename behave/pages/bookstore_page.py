from pages.base_page import BasePage
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC

HEADER_TITLE = (By.CSS_SELECTOR, ".main-header")
ADD_A_BOOK_IN_COLLECTION_BUTTON = (By.XPATH, "//button[text()='Add To Your Collection']")
FIRST_BOOK =  (By.CSS_SELECTOR,'a[href="/books?book=9781449325862"]')
WEBSITE_LABEL =  (By.CSS_SELECTOR,'#website-label')
WEBSITE_LINK =  (By.CSS_SELECTOR,'#website-wrapper #userName-value')
BACK_BUTTON =  (By.CSS_SELECTOR,'#addNewRecordButton')
SEARCH_FIELD =  (By.CSS_SELECTOR,'#searchBox')
SEARCH_RESULT_TABLE =  (By.CSS_SELECTOR,'.rt-tr-group:nth-child() .rt-td:nth-child()')


class BookstorePage(BasePage):
    
    
    def click_to_select_a_book(self, book_name):
        book_name_selector = (By.XPATH, "//a[text()='"+book_name+"']")
        super().click(EC.visibility_of_element_located(book_name_selector))
    

    def click_to_add_a_book(self):
        super().click(EC.visibility_of_element_located(ADD_A_BOOK_IN_COLLECTION_BUTTON))
    

    def get_alert_text(self):
        super().wait(EC.alert_is_present())
        return super().get_alert_text()

