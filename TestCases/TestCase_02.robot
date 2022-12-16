*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${baseUrl}              https://demo.nopcommerce.com/
${browser}              chrome
${title}                nopCommerce demo store
${loginLink}            class:ico-login
${emailInput}           id:Email
${passwordInput}        id:Password
${loginButton}          class:login-button
${email}                testemail@gmail.com
${password}             testPassword
${rememberMeCheckbox}   id:RememberMe

*** Test Cases ***
CheckboxTest
    open application
    title should be     ${title}
    login
    click remember me checkbox
    sleep   1
    clear element text  ${emailInput}
    sleep   1
    close browser

*** Keywords ***
open application
    open browser    ${baseUrl}  ${browser}
    maximize browser window

login
    click link      ${loginLink}
    input text      ${emailInput}       ${email}
    input text      ${passwordInput}    ${password}
    click element   ${loginButton}

click remember me checkbox
    click element   ${rememberMeCheckbox}