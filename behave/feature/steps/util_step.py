from behave import step
from pages.login_page import LoginPage
from pages.base_page import BasePage
from pages.bookstore_page import BookstorePage

@step(u'I access the application')
def step_impl(context):
    context.bookstore_page = BookstorePage(context.driver)
    context.login_page = LoginPage(context.driver)
    context.bookstore_page.open_url(context.base_url_bookstore)
    
    