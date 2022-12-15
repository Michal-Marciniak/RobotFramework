*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
LoginTest
    open browser    https://demo.nopcommerce.com/   chrome
    click link  css:a[class="ico-login"]
    input text  css:input#Email     Login
    input text  css:input#Password      Password
    click element   css:.buttons button.login-button
    close browser

*** Keywords ***
