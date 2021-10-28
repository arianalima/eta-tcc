import os
import json
import time
from selenium.webdriver.chrome.options import Options
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager


def before_all(context):
    context.base_url_bookstore = context.config.userdata['BASE_URL']

def before_feature(context, feature):
    chrome_options = Options()
    chrome_options.add_argument('--no-sandbox')
    context.driver = webdriver.Chrome(executable_path=ChromeDriverManager().install(), options=chrome_options)
    context.driver.maximize_window()
    context.execute_steps('''
    Given I access the application
    ''')

def after_feature(context, feature):
    context.driver.quit()