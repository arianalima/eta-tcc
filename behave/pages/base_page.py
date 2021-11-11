from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys

class BasePage:    
    
    def __init__(self, driver):
        self.driver = driver
        self.action = ActionChains(self.driver)


    def open_url(self, url):
        self.driver.get(url)


    def wait(self, condition, seconds=15):
        return WebDriverWait(driver=self.driver, timeout=seconds).until(condition)
    
    
    def find_element(self, condition, seconds=15):
        return self.wait(condition, seconds)


    def click(self, condition):
        try:
            self.find_element(condition).click()
        except:
            button = self.find_element(condition)
            self.driver.execute_script("arguments[0].click();", button)
    

    def type_in(self, condition, text):
        self.find_element(condition).send_keys(text)


    def move_to_element(self, condition):
        element = self.find_element(condition)
        self.action.move_to_element(element).perform()


    def wait_text_to_be_displayed(self, condition, text, timeout=10):
        element = self.find_element(condition)
        time = 0
        while (element.text != text or time < timeout):
            element = self.find_element(condition)
            time = time + 1


    def get_alert_text(self):
        alert_obj = self.driver.switch_to.alert
        return alert_obj.text


    def get_window_handles(self):
        return self.driver.window_handles
    

    def switch_to_window(self, condition):
        return self.driver.switch_to.window(condition)
    

    def get_window_url(self):
        return self.driver.current_url


    def get_window_title(self):
        return self.driver.title
    

    def open_element_on_new_tab(self, condition):
        element = self.find_element(condition)
        ActionChains(self.driver).key_down(Keys.CONTROL).click(element).key_up(Keys.CONTROL).perform()

    
    def get_element_text(self, condition):
        element = self.find_element(condition)
        return element.text