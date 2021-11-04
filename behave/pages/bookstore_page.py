from pages.base_page import BasePage
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC

HEADER_TITLE = (By.CSS_SELECTOR, ".main-header")
ADD_A_BOOK_IN_COLLECTION_BUTTON = (By.XPATH, "//button[text()='Add To Your Collection']")
FIRST_BOOK =  (By.CSS_SELECTOR,'a[href="/books?book=9781449325862"]')
WEBSITE_LABEL =  (By.ID,'website-label')
WEBSITE_LINK =  (By.CSS_SELECTOR,'#website-wrapper #userName-value')
BACK_BUTTON =  (By.ID,'addNewRecordButton')
SEARCH_FIELD =  (By.ID,'searchBox')
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


    def access_bookstore_url(self, bookstore_url):
        super().open_url(bookstore_url)


    def click_in_book(self):
        super().click(EC.element_to_be_clickable(FIRST_BOOK))


    def click_in_book_website_link(self):
        super().click(EC.element_to_be_clickable(WEBSITE_LINK))


    def scroll_to_link(self):
        element = super().find_element(EC.visibility_of_element_located(WEBSITE_LINK))
        element.location_once_scrolled_into_view


    def click_to_close_banner(self):
        super().click(EC.element_to_be_clickable(CLOSE_BANNER))
    

    # def insert_username(self, username):
    #     super().type_in(EC.visibility_of_element_located(USERNAME_INPUT), username)


    # def insert_password(self, password):
    #     super().type_in(EC.visibility_of_element_located(PASSWORD_INPUT), password)    
    

    # def get_screen_title(self):
    #     super().wait(EC.visibility_of_element_located(LOGOT_BUTTON))
    #     return super().find_element(EC.visibility_of_element_located(SCREEN_TITLE)).text
