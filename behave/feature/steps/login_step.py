from behave import step
from hamcrest import *


@step('The Login screen is opened')
def step_impl(context):
    context.login_page.open_login_screen()


@step('the fields are filled: "{username}" and "{password}"')
def step_impl(context, username, password):
    context.login_page.insert_credentials(username, password)


@step('the "Login" button is clicked')
def step_impl(context):
    context.login_page.click_in_login()


@step('the user is redirected to "{title}" screen')
def step_impl(context, title):
    assert_that(context.login_page.get_screen_title(), is_(title), "Title is not being displayed correctly")
