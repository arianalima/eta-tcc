from selenium.webdriver.common.by import By
from pages.base_page import BasePage
from selenium.webdriver.support import expected_conditions as EC

CLOSE_BANNER_BUTTON = (By.ID, "close-fixedban")


class BannerPage(BasePage):     
    def close_banner(self):
        super().wait(EC.presence_of_element_located(CLOSE_BANNER_BUTTON))
        super().click(EC.visibility_of_element_located(CLOSE_BANNER_BUTTON))
