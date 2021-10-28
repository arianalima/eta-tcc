from selenium import webdriver
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.action_chains import ActionChains

class BasePage:    
    
    def __init__(self, driver):
        self.driver = driver
        self.action = ActionChains(self.driver)


    def open_url(self, url):
        self.driver.get(url)


    def find_element(self, condition, seconds=9):
        return WebDriverWait(driver=self.driver, timeout=seconds).until(condition)
    

    def click(self, condition):
        self.find_element(condition, seconds=9).click()
    

    def type_in(self, condition, text):
        self.driver.find_element(condition).send_keys(text)
