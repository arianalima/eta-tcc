Feature: Login

    Login


Scenario: Successfull Login
Given I access login page
And I insert my login information 
    |username | password |
    | admin   | Admin1!! |
When I click in login button
Then I should be rediceted to "Profile" screen   
