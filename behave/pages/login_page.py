from selenium.webdriver.common.by import By
from pages.base_page import BasePage
from selenium.webdriver.support import expected_conditions as EC

USERNAME_INPUT = (By.ID, 'userName')
PASSWORD_INPUT = (By.ID, 'password')
LOGIN_FORM = (By.ID, 'userForm')
LOGIN_BUTTON = (By.ID, 'login')
LOGIN_MENU = (By.CSS_SELECTOR, '.show>.menu-list>li:nth-child(1)')
SCREEN_TITLE = (By.CSS_SELECTOR, '.main-header')


class LoginPage(BasePage):
    def open_login_screen(self):
        super().click(EC.visibility_of_element_located(LOGIN_MENU))
        welcome_message = "Welcome,\nLogin in Book Store\n"
        super().wait(EC.text_to_be_present_in_element(LOGIN_FORM, welcome_message))

    def insert_credentials(self, username, password):
        super().type_in(EC.visibility_of_element_located(USERNAME_INPUT), username)
        super().type_in(EC.visibility_of_element_located(PASSWORD_INPUT), password)

    def click_in_login(self):
        super().click(EC.element_to_be_clickable(LOGIN_BUTTON))

    def get_screen_title(self):
        super().wait(EC.text_to_be_present_in_element(SCREEN_TITLE, "Profile"))
        return super().find_element(EC.visibility_of_element_located(SCREEN_TITLE)).text
