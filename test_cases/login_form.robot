*** Settings ***
Resource          base.robot
Resource          ../page_objects/login_keywords.robot
Resource          ../resources/locators.robot

Test Setup        Start Session
Test Teardown        End Session

*** Test Cases ***
Login com sucesso
    Go To                  ${URL}/login
    Login With             tomsmith        SuperSecretPassword!

    Element Should Contain        ${logged_message}        You logged into a secure area!

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

