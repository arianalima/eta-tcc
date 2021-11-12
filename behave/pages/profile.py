from pages.base_page import BasePage
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from pages.login_page import SCREEN_TITLE, LoginPage

BOOKSTORE_BUTTON = (By.ID, 'gotoStore')
DELETE_SINGLE_BOOK_BUTTON= (By.ID, 'delete-record-undefined')
CONFIRM_DELETE_SINGLE_BOOK_BUTTON = (By.ID, 'closeSmallModal-ok')
CANCEL_DELETE_SINGLE_BOOK_BUTTON = (By.ID, 'closeSmallModal-cancel')
DELETE_ICON_TOOLTIP = (By.CSS_SELECTOR, "span[title='Delete']")
NO_ROWS_FOUND_TEXT = (By.XPATH, "//div[text()='No rows found']")
LOGOUT_BUTTON = (By.XPATH, "//button[text()='Log out']")
DELETE_ALL_BOOKS_BUTTON = (By.XPATH, "//div[@class='text-right button di']//button")
class ProfilePage(BasePage):    
    
    def click_in_bookstore_button(self):
        super().move_to_element(EC.presence_of_element_located(BOOKSTORE_BUTTON))
        super().click(EC.presence_of_element_located(BOOKSTORE_BUTTON))
        super().wait_text_to_be_displayed(EC.visibility_of_element_located(SCREEN_TITLE), 'Book Store')
    

    def click_in_button(self, button):
        button = (By.XPATH, "//span[text()='"+button+"']")
        super().click(EC.visibility_of_element_located(button))


    def click_to_delete_a_single_book(self, book_name):
        book_name_element = (By.XPATH, "//span[@id='see-book-"+book_name+"']//..//..//..//div[last()]//span[@id='delete-record-undefined']")
        super().wait(EC.visibility_of_element_located(book_name_element))
        super().click(EC.visibility_of_element_located(book_name_element))


    def confirm_delete_single_book(self):
        super().click(EC.visibility_of_element_located(CONFIRM_DELETE_SINGLE_BOOK_BUTTON))


    def cancel_delete_single_book(self):
        super().click(EC.visibility_of_element_located(CANCEL_DELETE_SINGLE_BOOK_BUTTON))


    def get_book_name_title(self, book_name):
        book_name_title = (By.CSS_SELECTOR, "span[id='see-book-"+book_name+"']")
        return super().is_displayed(EC.visibility_of_element_located(book_name_title))
    

    def hover_on_delete_icon(self):
        super().wait(EC.visibility_of_element_located(DELETE_SINGLE_BOOK_BUTTON))
        super().move_to_element(EC.visibility_of_element_located(DELETE_SINGLE_BOOK_BUTTON))


    def get_delete_icon_tooltip(self):
        return super().is_displayed(EC.visibility_of_element_located(DELETE_ICON_TOOLTIP))


    def get_no_books_found_information(self):
        super().wait(EC.presence_of_element_located(NO_ROWS_FOUND_TEXT))
        return super().is_displayed(EC.visibility_of_element_located(NO_ROWS_FOUND_TEXT))


    def click_to_delete_all_books(self):
        super().click(EC.visibility_of_element_located(DELETE_ALL_BOOKS_BUTTON))
