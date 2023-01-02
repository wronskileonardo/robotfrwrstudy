*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${URL}        http://the-internet.herokuapp.com/
${BROWSER}        CHROME


*** Keywords ***
Start Session
    Open Browser        ${URL}        ${BROWSER}

End Session
    Capture Page Screenshot
    Close Browser