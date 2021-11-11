from behave import step
from pages.bookstore_page import BookstorePage
from pages.profile import ProfilePage
from pages.login_page import LoginPage
from pages.banner_page import BannerPage


@step(u'I access the application')
def step_impl(context):
    context.bookstore_page = BookstorePage(context.driver)
    context.login_page = LoginPage(context.driver)
    context.profile_page = ProfilePage(context.driver)
    context.banner_page = BannerPage(context.driver)
    context.bookstore_page.open_url(context.base_url_bookstore)
    