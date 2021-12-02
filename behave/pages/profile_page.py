from pages.base_page import BasePage
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from pages.login_page import SCREEN_TITLE

BOOKSTORE_BUTTON = (By.ID, 'gotoStore')
DELETE_SINGLE_BOOK_BUTTON = (By.ID, 'delete-record-undefined')
CONFIRM_DELETE_SINGLE_BOOK_BUTTON = (By.ID, 'closeSmallModal-ok')
CANCEL_DELETE_SINGLE_BOOK_BUTTON = (By.ID, 'closeSmallModal-cancel')
DELETE_ICON_TOOLTIP = (By.CSS_SELECTOR, "span[data-toggle='tooltip'][title='Delete']")
NO_ROWS_FOUND_TEXT = (By.CSS_SELECTOR, ".rt-noData")
DELETE_ALL_BOOKS_BUTTON = (By.CSS_SELECTOR, ".di>#submit")
HEADER_TITLE = (By.CSS_SELECTOR, '.main-header')


class ProfilePage(BasePage):
    def click_in_bookstore_button(self):
        super().move_to_element(EC.presence_of_element_located(BOOKSTORE_BUTTON))
        super().click(EC.presence_of_element_located(BOOKSTORE_BUTTON))
        super().wait_text_to_be_displayed(EC.visibility_of_element_located(SCREEN_TITLE), 'Book Store')

    def click_in_button(self, button):
        locator = (By.XPATH, "//span[text()='"+button+"']")
        super().click(EC.visibility_of_element_located(locator))
        super().wait(EC.text_to_be_present_in_element(HEADER_TITLE, button))

    def click_to_delete_a_single_book(self, book_name):
        book_name_element = (By.XPATH, "//span[@id='see-book-"+book_name+"']//..//..//..//div[last()]//span[@id='delete-record-undefined']")
        super().click(EC.visibility_of_element_located(book_name_element))

    def confirm_delete_single_book(self):
        super().click(EC.visibility_of_element_located(CONFIRM_DELETE_SINGLE_BOOK_BUTTON))

    def cancel_delete_single_book(self):
        super().click(EC.visibility_of_element_located(CANCEL_DELETE_SINGLE_BOOK_BUTTON))

    def is_book_displayed(self, book_name):
        book_name_title = (By.CSS_SELECTOR, "span[id='see-book-"+book_name+"']")
        return super().find_element(EC.visibility_of_element_located(book_name_title)).is_displayed()

    def hover_on_delete_icon(self):
        super().move_to_element(EC.visibility_of_element_located(DELETE_SINGLE_BOOK_BUTTON))

    def is_delete_icon_tooltip_displayed(self):
        return super().find_element(EC.visibility_of_element_located(DELETE_ICON_TOOLTIP)).is_displayed()

    def is_no_books_found_displayed(self):
        return super().find_element(EC.visibility_of_element_located(NO_ROWS_FOUND_TEXT)).is_displayed()

    def click_to_delete_all_books(self):
        super().click(EC.visibility_of_element_located(DELETE_ALL_BOOKS_BUTTON))
