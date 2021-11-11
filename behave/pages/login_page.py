from selenium.webdriver.common.by import By
from pages.base_page import BasePage
from selenium.webdriver.support import expected_conditions as EC

USERNAME_INPUT = (By.ID, 'userName')
PASSWORD_INPUT = (By.ID, 'password')
LOGIN_BUTTON = (By.ID, 'login')
SCREEN_TITLE = (By.CLASS_NAME, 'main-header')
LOGOT_BUTTON = (By.XPATH, "//button[text()='Log out']")
class LoginPage(BasePage):
    def access_login_url(self, login_url):
        super().open_url(login_url)

    
    def insert_username(self, username):
        super().type_in(EC.visibility_of_element_located(USERNAME_INPUT), username)


    def insert_password(self, password):
        super().type_in(EC.visibility_of_element_located(PASSWORD_INPUT), password)
    
    
    def click_in_login(self):
        super().click(EC.element_to_be_clickable(LOGIN_BUTTON))
    

    def get_screen_title(self):
        super().wait(EC.visibility_of_element_located(LOGOT_BUTTON))
        return super().find_element(EC.visibility_of_element_located(SCREEN_TITLE)).text