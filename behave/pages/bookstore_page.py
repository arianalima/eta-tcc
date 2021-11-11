from selenium.webdriver.common.by import By
from pages.base_page import BasePage

FIRST_BOOK =  (By.CSS_SELECTOR,'a[href="/books?book=9781449325862"]')
WEBSITE_LABEL =  (By.CSS_SELECTOR,'#website-label')
WEBSITE_LINK =  (By.CSS_SELECTOR,'#website-wrapper #userName-value')
CLOSE_BANNER =  (By.CSS_SELECTOR,'#close-fixedban')
BACK_BUTTON =  (By.CSS_SELECTOR,'#addNewRecordButton')
SEARCH_FIELD =  (By.CSS_SELECTOR,'#searchBox')
SEARCH_RESULT_TABLE =  (By.CSS_SELECTOR,'.rt-tr-group:nth-child() .rt-td:nth-child()')


class BookstorePage(BasePage):
    def xpto(self):
        super().find_element