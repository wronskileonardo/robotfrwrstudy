*** Settings ***
Resource        ../resources/locators.robot

*** Keywords ***    
Login With
    [Arguments]        ${username}        ${password}
    
    Input Text        ${username_field}        ${username}
    Input Text        ${password_field}        ${password}
    Click Element        ${login_button}