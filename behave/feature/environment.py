import os

from selenium.webdriver.chrome.options import Options
from selenium import webdriver
from steps.util_step import *
from utils.util import *


def before_all(context):
    context.base_url_bookstore = context.config.userdata['BASE_URL']
    context.chromedriver = os.path.join(os.path.dirname(__file__), context.config.userdata['CHROMEDRIVER'])
    context.valid_username = context.config.userdata['VALID_USERNAME']
    context.valid_password = context.config.userdata['VALID_PASSWORD']


def before_scenario(context, feature):
    chrome_options = Options()
    context.driver = webdriver.Chrome(executable_path=context.chromedriver, options=chrome_options)
    context.driver.maximize_window()
    open_application(context)


def after_scenario(context, scenario):
    if "delete_all" in scenario.tags:
        delete_all_books(context)
    if "logout" in scenario.tags:
        context.execute_steps('''
        Then the user is logged out
        ''')
    context.driver.quit()

