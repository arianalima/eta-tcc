from hamcrest import *

@step('I access login page')
def step_impl(context):
    context.login_page.access_login_url('https://demoqa.com/login')


@step('I insert my login information')
def step_impl(context):
    for row in context.table:
        context.login_page.insert_username(row['username'])
        context.login_page.insert_password(row['password'])

@step('I click in login button')
def step_impl(context):
    context.login_page.click_in_login()


@step('I should be redirected to "{title}" screen')
def step_impl(context, title):
    assert_that(context.login_page.get_screen_title(), is_(title), "Title is not being displayed correctly")