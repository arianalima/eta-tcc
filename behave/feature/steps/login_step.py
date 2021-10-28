
@step('I access login page')
def step_impl(context):
    context.login_page.access_login_url('https://demoqa.com/login')


@step('I insert my login information')
def step_impl(context):
    for row in context.table:
        context.login_page.insert_username(row['username'])
        context.login_page.insert_password(row['password'])

@step(u'I click in login button')
def step_impl(context):
    pass


@step(u'I should be rediceted to profile screen')
def step_impl(context):
    pass