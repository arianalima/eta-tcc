from behave import step
from hamcrest import assert_that, is_


@step('I select the "{book_name}" book')
def step_impl(context, book_name):
    context.bookstore_page.click_to_select_a_book(book_name)


@step('I click on its website link')
def step_impl(context):
    context.banner_page.close_banner()
    context.bookstore_page.scroll_to_link()
    context.bookstore_page.click_in_book_website_link()


@step('I should be able to see the tabs information as displayed below')
def step_impl(context):
    tabs_information = context.bookstore_page.get_all_browser_tabs_information()
    tab_titles = tabs_information[0]
    tab_urls = tabs_information[1]
    for row, index in zip(context.table, range(len(tab_titles))): 
        assert_that(tab_titles[index], is_(row['title']), "The title of the tab is incorrect!")
        assert_that(tab_urls[index], is_(row['url']), "The url of the tab is incorrect!")


@step('I select to open the book "{book_name}" information on a new tab')
def step_impl(context, book_name):
    context.bookstore_page.click_to_open_on_new_tab(book_name)


@step('I should see that a new tab is opened with the Books information as displayed below')
def step_impl(context):
    book_information = context.bookstore_page.get_book_information()
    for row in context.table:
        assert_that(book_information[0], is_(row["ISBN"]), "The Book's ISBN information is incorrect!")
        assert_that(book_information[1], is_(row["title"]), "The Book's Title information is incorrect!")
        assert_that(book_information[2], is_(row["author"]), "The Book's Author information is incorrect!")
        assert_that(book_information[3], is_(row["publisher"]), "The Book's Publisher information is incorrect!")


@step('I search the bookstore for "{search_text}"')
def step_impl(context, search_text):
    context.bookstore_page.search_for_book(search_text)


@step('I verify that the books returned are displayed in rows as below')
def step_impl(context):
    book_search_result = context.bookstore_page.get_book_search_result()
    for row, result in zip(context.table, book_search_result):
        assert_that(result[0], is_(row["title"]), "The Book's Title information is incorrect!")
        assert_that(result[1], is_(row["author"]), "The Book's Author information is incorrect!")
        assert_that(result[2], is_(row["publisher"]), "The Book's Publisher information is incorrect!")


@step('I click to sort by the column {column}')
def step_impl(context, column):
    context.banner_page.close_banner()
    context.bookstore_page.click_to_sort_books_by_column(column)


@step('I should see that the rows are ordered by the selected column {column}')
def step_impl(context, column):
    if column.upper() == 'AUTHOR':
        column_index = 3
    elif column.upper() == 'PUBLISHER':
        column_index = 4
    result = context.bookstore_page.get_sorted_column_info(column_index)
    sorted_result = result
    sorted_result.sort()
    assert_that(result, is_(sorted_result), "The sorted column is incorrect!")


@step('I select {total_books_displayed} books to be displayed per page')
def step_impl(context,total_books_displayed):
    context.banner_page.close_banner()
    context.bookstore_page.select_books_per_page_amount(total_books_displayed)

@step('I verify that only {book_total} books are displayed per page')
def step_impl(context, book_total):
    pass


@step('I click on the Next button')
def step_impl(context):
    pass
