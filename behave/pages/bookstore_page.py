from pages.base_page import BasePage
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC

HEADER_TITLE = (By.CSS_SELECTOR, ".main-header")
ADD_A_BOOK_IN_COLLECTION_BUTTON = (By.XPATH, "//button[text()='Add To Your Collection']")
WEBSITE_LABEL =  (By.ID,'website-label')
WEBSITE_LINK =  (By.CSS_SELECTOR,'#website-wrapper #userName-value')
BACK_BUTTON =  (By.ID,'addNewRecordButton')
SEARCH_FIELD =  (By.ID,'searchBox')
SEARCH_RESULT_TABLE_ROW =  (By.CSS_SELECTOR,'.rt-tr-group')
SEARCH_RESULT_TABLE_COLUMN =  (By.CSS_SELECTOR,'.rt-tr-group:nth-child(1) .rt-td')
SORT_BY_COLUMNS_BUTTON = (By.CSS_SELECTOR,'.rt-th')
BOOKS_PER_PAGE_DROP_DOWN = (By.CSS_SELECTOR,'.select-wrap>select')
NEXT_BOOK_PAGE_BUTTON = (By.CSS_SELECTOR,'.-next>button')


class BookstorePage(BasePage):
    
    
    def click_to_select_a_book(self, book_name):
        book_name_selector = (By.XPATH, "//a[text()='"+book_name+"']")
        super().click(EC.visibility_of_element_located(book_name_selector))
    

    def click_to_add_a_book(self):
        super().click(EC.visibility_of_element_located(ADD_A_BOOK_IN_COLLECTION_BUTTON))
    

    def get_alert_text(self):
        super().wait(EC.alert_is_present())
        return super().get_alert_text()


    def access_bookstore_url(self, bookstore_url):
        super().open_url(bookstore_url)


    def click_in_book_website_link(self):
        super().click(EC.element_to_be_clickable(WEBSITE_LINK))


    def scroll_to_link(self):
        element = super().find_element(EC.visibility_of_element_located(WEBSITE_LINK))
        element.location_once_scrolled_into_view
    

    def get_all_browser_tabs_information(self):
        tab_titles = []
        tab_urls = []
        browser_tabs = super().get_window_handles()
        size = len(browser_tabs)
        for tab_position in range(size):
            super().switch_to_window(browser_tabs[tab_position])
            tab_titles.append(super().get_window_title())
            tab_urls.append(super().get_window_url())
        return tab_titles, tab_urls


    def click_to_open_on_new_tab(self, book_name):
        book_name_selector = (By.XPATH, "//a[text()='"+book_name+"']")
        super().open_element_on_new_tab(EC.visibility_of_element_located(book_name_selector))


    def get_book_information(self):
        field_names = ["ISBN", "title", "author", "publisher"]
        book_information = []
        for field in field_names:
            book_info_selector = (By.CSS_SELECTOR, "#"+field+"-wrapper #userName-value")
            book_information.append(super().get_element_text(EC.visibility_of_element_located(book_info_selector)))
        return book_information


    def search_for_book(self, search_text):
        super().type_in(EC.visibility_of_element_located(SEARCH_FIELD), search_text)


    def get_book_table_result(self):
        search_result = []
        search_result_column_length = len(super().find_element(EC.visibility_of_all_elements_located(SEARCH_RESULT_TABLE_COLUMN)))
        search_result_row_length = len(super().find_element(EC.visibility_of_all_elements_located(SEARCH_RESULT_TABLE_ROW)))
        for row_index in range(1,search_result_row_length + 1):
            search_result_line = []
            for column_index in range(2,search_result_column_length + 1):
                search_result_selector = (By.CSS_SELECTOR,'.rt-tr-group:nth-child('+str(row_index)+') .rt-td:nth-child('+str(column_index)+')')
                search_result_line.append(super().get_element_text(EC.visibility_of_element_located(search_result_selector)))
            if search_result_line[0] != ' ':
                search_result.append(search_result_line)
        return search_result


    def click_to_sort_books_by_column(self, column):
        elements = super().find_element(EC.visibility_of_all_elements_located(SORT_BY_COLUMNS_BUTTON))
        for element in elements:
            if element.text.lower() == column.lower():
                super().click(EC.visibility_of(element))
                break


    def get_sorted_column_info(self, column_index):
        sort_result = []
        search_result_row_length = len(super().find_element(EC.visibility_of_all_elements_located(SEARCH_RESULT_TABLE_ROW)))
        for row_index in range(1,search_result_row_length + 1):
            sort_result_selector = (By.CSS_SELECTOR,'.rt-tr-group:nth-child('+str(row_index)+') .rt-td:nth-child('+str(column_index)+')')
            sorted_cell = super().get_element_text(EC.visibility_of_element_located(sort_result_selector))
            if sorted_cell != ' ':
                sort_result.append(sorted_cell)            
        return sort_result


    def select_books_per_page_amount(self, book_rows):
        super().select_drop_down_option(EC.element_to_be_clickable(BOOKS_PER_PAGE_DROP_DOWN), book_rows)


    def click_next_books_page(self):
        super().click(EC.element_to_be_clickable(NEXT_BOOK_PAGE_BUTTON))
    
    
    def accept_alert(self):
        super().wait(EC.alert_is_present())
        return super().accept_alert()
