from pages.bookstore_page import BookstorePage
from pages.main_page import MainPage
from pages.profile import ProfilePage
from pages.login_page import LoginPage
from pages.banner_page import BannerPage


def open_application(context):
    context.bookstore_page = BookstorePage(context.driver)
    context.login_page = LoginPage(context.driver)
    context.profile_page = ProfilePage(context.driver)
    context.banner_page = BannerPage(context.driver)
    context.main_page = MainPage(context.driver)
    context.bookstore_page.open_url(context.base_url_bookstore)
    context.banner_page.close_banner()
    context.main_page.open_bookstore()


def delete_all_books(context):
    context.profile_page.click_to_delete_all_books()
    context.profile_page.confirm_delete_single_book()
    context.bookstore_page.accept_alert()
