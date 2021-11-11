
from behave.pages.base_page import BasePage

from selenium.webdriver.common.by import By
from pages.base_page import BasePage
from selenium.webdriver.support import expected_conditions as EC

BOOKSTORE_BUTTON = (By.ID, 'gotoStore')


class ProfilePage(BasePage):    
    
    def click_in_bookstore_button(self):
        super().click(EC.visibility_of_element_located(BOOKSTORE_BUTTON))
