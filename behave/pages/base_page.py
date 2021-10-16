from selenium.webdriver.support.wait import WebDriverWait


class BasePage:    
    
    def __init__(self, driver):
        self.driver = driver

    def find_element(self, condition, seconds=9):
        return WebDriverWait(driver=self.driver, timeout=seconds).until(condition)
    