from behave import step
from hamcrest import assert_that, is_
from utils.constants import TABS_NAMES


@step('I click on a book')
def step_impl(context):
    context.bookstore_page.click_in_book()

@step('I click on its website link')
def step_impl(context):
    context.bookstore_page.click_to_close_banner()
    context.bookstore_page.scroll_to_link()
    context.bookstore_page.click_in_book_website_link()

@step('I should see that a new tab is opened')
def step_impl(context):
    context.tabs_titles = []
    browser_tabs = context.driver.window_handles
    size = len(browser_tabs)
    assert_that(size, is_, 2)
    for x in range(size):
        context.driver.switch_to.window(browser_tabs[x])
        print(context.driver.title)
        context.tabs_titles.append(context.driver.title)
    

@step('I should be able to see the information about the selected book')
def step_impl(context):
    for x in range(len(context.tabs_titles)):
        assert_that(context.tabs_titles[x], is_(TABS_NAMES[x]), "The title of the tab is incorrect!")


@step('I click to open the book information on a new tab')
def step_impl(context):
    pass

@step('I should see that a new tab is opened with the Books information')
def step_impl(context):
    pass