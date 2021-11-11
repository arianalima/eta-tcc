
@step('I should be rediceted to "Profile" screen')
def step_impl(context):
    pass

@step('I click to open the book store')
def step_impl(context):
    context.profile_page.click_in_bookstore_button()


@step('I click to add a book')
def step_impl(context):
    pass


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