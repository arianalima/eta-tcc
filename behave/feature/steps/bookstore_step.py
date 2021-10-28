from behave import step


@step('oi')
def step_impl(context):
    assert(False, "FUNFOU")
    print("PRINTOU")
