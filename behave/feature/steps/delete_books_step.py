from behave import step
from hamcrest.core import assert_that
from hamcrest.core.core.is_ import is_


@step('I click to open the book store')
def step_impl(context):
    context.profile_page.click_in_bookstore_button()


@step('I open "{book_name}" book')
def step_impl(context, book_name):
    context.bookstore_page.click_to_select_a_book(book_name)
    context.banner_page.close_banner()


@step('I add the book to my collection')
def step_impl(context):
    context.bookstore_page.click_to_add_a_book()
    assert_that(context.bookstore_page.get_alert_text(), is_("Book added to your collection."),
                "Alert text is not being displayed as expected")
    context.bookstore_page.accept_alert()


@step('I return to "{button_name}" screen')
def step_impl(context, button_name):
    context.profile_page.click_in_button(button_name)


@step('I click to delete the "{book_name}" book')
def step_impl(context, book_name):
    context.profile_page.click_to_delete_a_single_book(book_name)


@step('I click to {action} the deletion')
def step_impl(context, action):
    if action.lower() == 'cancel':
        context.profile_page.cancel_delete_single_book()
    else:
        context.profile_page.confirm_delete_single_book()
        context.bookstore_page.accept_alert()


@step('I should be able to see "{title}" book in my profile')
def step_impl(context, title):
    assert_that(context.profile_page.is_book_displayed(title), is_(True), "Book is not being displayed")


@step('I hover on Delete icon')
def step_impl(context):
    context.profile_page.hover_on_delete_icon()


@step('I should see the tooltip')
def step_impl(context):
    assert_that(context.profile_page.is_delete_icon_tooltip_displayed(), is_(True), "Tooltip is not being displayed")


@step('I should not be able to see books in my profile')
def step_impl(context):
    assert_that(context.profile_page.is_no_books_found_displayed(), is_(True), "Book is being displayed")
