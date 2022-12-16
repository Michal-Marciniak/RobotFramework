*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${baseUrl}  https://demo.nopcommerce.com/
${browser}  chrome

*** Test Cases ***
LoginTest
    open browser    ${baseUrl}  ${browser}
    login
    close browser

*** Keywords ***
login
    click link      css:a[class="ico-login"]
    input text      css:input#Email     Login
    input text      css:input#Password      Password
    click element   css:.buttons button.login-button