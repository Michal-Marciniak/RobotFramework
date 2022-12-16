*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${baseUrl}              https://demo.nopcommerce.com/
${browser}              chrome
${loginLink}            class:ico-login
${emailInput}           id:Email
${passwordInput}        id:Password
${loginButton}          class:login-button
${email}                testemail@gmail.com
${password}             testPassword

*** Test Cases ***
LoginTest
    open application
    login
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