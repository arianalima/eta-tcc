from selenium.webdriver.support import expected_conditions as ec
from selenium.webdriver.common.by import By
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from pages.base_page import BasePage
from selenium.webdriver.support import expected_conditions as EC

USERNAME_INPUT = (By.CSS_SELECTOR, '#username')
PASSWORD_INPUT = (By.CSS_SELECTOR, '#password')
class LoginPage(BasePage):
    def access_login_url(self, login_url):
        super().open_url(login_url)

    
    def insert_username(self, username):
        super().type_in(EC.visibility_of_element_located(USERNAME_INPUT), username)


    def insert_password(self, password):
        super().type_in(EC.visibility_of_element_located(PASSWORD_INPUT), password)