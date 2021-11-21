from behave import step
from hamcrest import assert_that, is_


@step('I select the "{book_name}" book')
def step_impl(context, book_name):
    context.bookstore_page.click_to_select_a_book(book_name)


@step('I click on its website link')
def step_impl(context):
    context.banner_page.close_banner()
    context.bookstore_page.click_in_book_website_link()


@step('I open the book "{book_name}" information on a new tab')
def step_impl(context, book_name):
    context.bookstore_page.click_to_open_on_new_tab(book_name)


@step('I search the bookstore for "{search_text}"')
def step_impl(context, search_text):
    context.bookstore_page.search_for_book(search_text)


@step('The search result should match')
def step_impl(context):
    book_search_result = context.bookstore_page.get_book_table_result()
    for row, result in zip(context.table, book_search_result):
        assert_that(result[0], is_(row["title"]), "The Book's Title information is incorrect!")
        assert_that(result[1], is_(row["author"]), "The Book's Author information is incorrect!")
        assert_that(result[2], is_(row["publisher"]), "The Book's Publisher information is incorrect!")


@step('I click on the column {column}')
def step_impl(context, column):
    context.banner_page.close_banner()
    context.bookstore_page.click_to_sort_books_by_column(column)


@step('I should see that the rows are ordered by the selected column {column_name}')
def step_impl(context, column_name):
    result = context.bookstore_page.is_result_sorted_by_column(column_name)
    assert_that(result, is_(True), "The sorted column is incorrect!")


@step('I select {book_rows} books to be displayed per page')
def step_impl(context, book_rows):
    context.banner_page.close_banner()
    context.bookstore_page.select_books_per_page_amount(book_rows)


@step('I click on the Next button')
def step_impl(context):
    context.bookstore_page.click_next_books_page()


@step('I verify that only {book_total} books are displayed per page')
def step_impl(context, book_total):
    table_length = len(context.bookstore_page.get_book_table_result())
    assert_that(int(table_length), is_(int(book_total)), "The displayed amount of books is incorrect!")


@step("I should see that a new tab is opened")
def step_impl(context):
    tab_titles = context.bookstore_page.get_all_opened_tabs_title()
    context.opened_tab = tab_titles[1]
    count = len(tab_titles)
    assert_that(count, is_(2))
    assert_that(tab_titles[0], is_("ToolsQA"), "The title of the tab is incorrect!")


@step('I should be able to see the website about the selected book')
def step_impl(context):
    assert_that(context.opened_tab, is_("O'Reilly Media - Technology and Business Training"))


@step('I should see that a new tab is opened with "{book_title}" details')
def step_impl(context, book_title):
    tab_titles = context.bookstore_page.get_all_opened_tabs_title()
    count = len(tab_titles)
    assert_that(count, is_(2))
    assert_that(context.bookstore_page.get_book_title(), is_(book_title))
