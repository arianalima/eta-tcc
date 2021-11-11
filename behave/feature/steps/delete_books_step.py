

from hamcrest.core import assert_that
from hamcrest.core.core.is_ import is_


@step('I click to open the book store')
def step_impl(context):
    context.banner_page.close_banner()
    context.profile_page.click_in_bookstore_button()


@step('I click to add "{book_name}" book')
def step_impl(context, book_name):
    context.bookstore_page.click_to_select_a_book(book_name)
    context.bookstore_page.click_to_add_a_book()
    assert_that(context.bookstore_page.get_alert_text(), is_("Book added to your collection."), "Alert text is not being displayed as expected")


@step('I return to "Profile" screen')
def step_impl(context):
    pass


@step('I click to delete a book')
def step_impl(context):
    pass


@step('I click to cancel the deletion')
def step_impl(context):
    pass


@step('I should be able to see one book in my profile')
def step_impl(context):
    pass