from pages.base_page import BasePage
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC

HEADER_TITLE = (By.CSS_SELECTOR, ".main-header")
ADD_A_BOOK_IN_COLLECTION_BUTTON = (By.XPATH, "//button[text()='Add To Your Collection']")

class BookstorePage(BasePage):
    
    
    def click_to_select_a_book(self, book_name):
        book_name_selector = (By.XPATH, "//a[text()='"+book_name+"']")
        super().click(EC.visibility_of_element_located(book_name_selector))
    

    def click_to_add_a_book(self):
        super().click(EC.visibility_of_element_located(ADD_A_BOOK_IN_COLLECTION_BUTTON))
    

    def get_alert_text(self):
        super().wait(EC.alert_is_present())
        return super().get_alert_text()


    def accept_alert(self):
        super().wait(EC.alert_is_present())
        return super().accept_alert()