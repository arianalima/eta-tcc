from pages.base_page import BasePage
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from pages.login_page import SCREEN_TITLE, LoginPage

BOOKSTORE_BUTTON = (By.ID, 'gotoStore')

class ProfilePage(BasePage):    
    
    def click_in_bookstore_button(self):
        super().move_to_element(EC.presence_of_element_located(BOOKSTORE_BUTTON))
        super().click(EC.presence_of_element_located(BOOKSTORE_BUTTON))
        super().wait_text_to_be_displayed(EC.visibility_of_element_located(SCREEN_TITLE), 'Book Store')
