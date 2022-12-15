*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${baseUrl}  https://demo.nopcommerce.com/
${browser}  chrome

*** Test Cases ***
LoginTest
    login
    close browser

*** Keywords ***
login
    open browser    ${baseUrl}  ${browser}
    click link      css:a[class="ico-login"]
    input text      css:input#Email     Login
    input text      css:input#Password      Password
    click element   css:.buttons button.login-button