*** Settings ***
Resource          base.robot
Resource          ../page_objects/login_keywords.robot
Resource          ../resources/locators.robot

Test Setup        Start Session
Test Teardown        End Session

*** Test Cases ***
Login with success
    Go To                  ${URL}login
    Login With             tomsmith        SuperSecretPassword!

    Element Should Contain        ${log_message}        You logged into a secure area!


Invalid username
    Go To        ${URL}login
    Login With        notanusername        SuperSecretPassword!

    Element Should Contain        ${log_message}        Your username is invalid!

Invalid password
    Go To        ${URL}login
    Login With        tomsmith        notapassword

    Element Should Contain        ${log_message}        Your password is invalid!

Logout from page
    Go To                  ${URL}login
    Login With             tomsmith        SuperSecretPassword!

    Element Should Contain        ${log_message}        You logged into a secure area!

    Click Element                 ${logout_button}
    Element Should Contain        ${log_message}        You logged out of the secure area!
### BDD EXAMPLE ###

# *** Test Cases ***
# Add two numbers
#     Given I have Calculator open
#     When I add 2 and 40
#     Then result should be 42

# Add negative numbers
#     Given I have Calculator open
#     When I add 1 and -2
#     Then result should be -1

# *** Keywords ***
# I have ${program} open
#     Start Program    ${program}

# I add ${number 1} and ${number 2}
#     Input Number    ${number 1}
#     Push Button     +
#     Input Number    ${number 2}
#     Push Button     =

# Result should be ${expected}
#     ${result} =    Get Result
#     Should Be Equal    ${result}    ${expected}

