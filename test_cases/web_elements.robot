*** Settings ***
Library           BuiltIn
Resource          base.robot
Resource          ../page_objects/login_keywords.robot
Resource          ../resources/locators.robot

Test Setup        Start Session
Test Teardown        End Session

*** Test Cases ***
Count each hover image and validate them
    Go To        ${URL}hovers

    ${ELEMENT_COUNT}=        Get Element Count        ${hover_images}
    
    FOR    ${loop}    IN RANGE    1    ${ELEMENT_COUNT}+1
        ${CURRENT_IMAGE_XPATH}=    CATENATE    ${hover_images} [ ${loop} ]
        ${CURRENT_LABEL_XPATH}=    CATENATE    ${CURRENT_IMAGE_XPATH}    ${hover_label}
        ${CURRENT_LABEL_TEXT}=    CATENATE    name: user${loop}

        Mouse Over      ${CURRENT_IMAGE_XPATH}
        Wait Until Element Contains        ${CURRENT_LABEL_XPATH}        ${CURRENT_LABEL_TEXT}        5s
        Mouse Out        ${CURRENT_IMAGE_XPATH}
        Element Should Not Be Visible        ${CURRENT_LABEL_TEXT}
    END

Upload a file from the project
    Go To        ${URL}upload

    Choose File            ${select_file_button}        ${EXECDIR}/resources/test_assets/temp_10mb_file
    Click Element        ${upload_file_button}
    Wait Until Element Contains        ${uploaded_successfully_text}        File Uploaded!        20s