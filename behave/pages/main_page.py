from selenium.webdriver.common.by import By
from pages.base_page import BasePage
from selenium.webdriver.support import expected_conditions as EC

BOOKSTORE_CARD = (By.CSS_SELECTOR, ".category-cards > div:nth-child(6)")


class MainPage(BasePage):
    def open_bookstore(self):
        super().click(EC.visibility_of_element_located(BOOKSTORE_CARD))
