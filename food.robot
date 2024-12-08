*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}         https://robot-testing-alpha.vercel.app/
${FOOD_URL}          https://robot-testing-alpha.vercel.app/food.html
${BROWSER}           Chrome
${VALID_USERNAME}    user
${VALID_PASSWORD}    password

*** Test Cases ***
Test Food Selection and Add to Cart
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

    Login to Food Page
    # Sleep    2s
    Verify Food Page Elements
    Sleep    1s
    Select All Foods
    Sleep    1s
    Click Add to Cart
    Sleep    1s
    Verify Cart Popup
    Sleep    1s
    [Teardown]    Close Browser

*** Keywords ***
Login to Food Page
    Input Text      id=username    ${VALID_USERNAME}

    Input Text      id=password    ${VALID_PASSWORD}

    Wait Until Element Is Visible    xpath=//button[text()='Login']    2s
    Click Element   xpath=//button[text()='Login']
    Sleep    2s
    Wait Until Location Is    ${FOOD_URL}    2s

Verify Food Page Elements
    Page Should Contain Element    id=pizza

    Page Should Contain Element    id=burger

    Page Should Contain Element    id=pasta

    Page Should Contain Element    id=addToCartButton


Select All Foods
    Click Element    id=pizza

    Click Element    id=burger
    Click Element    id=pasta

Click Add to Cart
    Click Element    id=addToCartButton

Verify Cart Popup
    Wait Until Element Is Visible    id=popup    1s
    Element Should Contain    id=popupMessage    Pizza

    Element Should Contain    id=popupMessage    Burger

    Element Should Contain    id=popupMessage    Pasta

    Click Element    xpath=//button[text()='Continue']

