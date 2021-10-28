from selenium.webdriver.common.by import By
from pages.base_page import BasePage

CLOSE_BANNER = (By.CSS_SELECTOR, "#close-fixedban")
HEADER_TITLE = (By.CSS_SELECTOR, ".main-header")

class BookstorePage(BasePage):
    def xpto(self):
        super().find_element