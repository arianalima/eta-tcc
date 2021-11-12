

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
    
       
@step('I verify that the book was added correctly')
def step_impl(context):
    assert_that(context.bookstore_page.get_alert_text(), is_("Book added to your collection."), "Alert text is not being displayed as expected")
    context.bookstore_page.accept_alert()


@step('I return to "{button_name}" screen')
def step_impl(context, button_name):
    context.profile_page.click_in_button(button_name)


@step('I click to delete the "{book_name}" book')
def step_impl(context, book_name):
    context.profile_page.click_to_delete_a_single_book(book_name)


@step('I click to {action} the deletion')
def step_impl(context, action):
    if (action.lower()== 'cancel'):
        context.profile_page.cancel_delete_single_book()
    else:
        context.profile_page.confirm_delete_single_book()


@step('I should be able to see this book below in my profile')
def step_impl(context):
    for row in context.table:
        assert_that(context.profile_page.get_book_name_title(row['title']), is_(True), "Book is not being displayed")


@step('I hover on Delete icon')
def step_impl(context):
    context.profile_page.hover_on_delete_icon()


@step('I should see the tooltip')
def step_impl(context):
    assert_that(context.profile_page.get_delete_icon_tooltip(), is_(True), "Tooltip is not being displayed")


@step('I should see a warning informing that {amount} book(s) was deleted')
def step_impl(context, amount):
    if (amount.lower() == 'the'):
        assert_that(context.bookstore_page.get_alert_text(), is_("Book deleted."), "Warning is not being displayed as expected")
    if (amount.lower() == 'all'):
        assert_that(context.bookstore_page.get_alert_text(), is_("All Books deleted."), "Warning is not being displayed as expected")    
    context.bookstore_page.accept_alert()


@step('I should not be able to see books in my profile')
def step_impl(context):
    assert_that(context.profile_page.get_no_books_found_information(), is_(True), "Book is being displayed")


@step('I click to delete all books')
def step_impl(context):
    context.profile_page.click_to_delete_all_books()