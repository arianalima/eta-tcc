from behave import step


@step('the user is logged in')
def step_impl(context):
    context.login_page.open_login_screen()
    context.login_page.insert_credentials(context.valid_username, context.valid_password)
    context.login_page.click_in_login()
    context.login_page.get_screen_title()


@step('the user is logged out')
def step_impl(context):
    context.bookstore_page.logout()
