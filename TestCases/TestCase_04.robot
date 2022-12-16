*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${baseUrl}                  https://www.tutorialspoint.com/selenium/selenium_automation_practice.htm
${browser}                  chrome
${consentButton}            class:fc-button-label

*** Test Cases ***
CheckboxTest

    set implicit wait

    open application
    click element               ${consentButton}

    # Selecting option from dropdown list
    select from list by label   continents   Europe

    # Selecting options from list-box
    select from list by label   selenium_commands   Browser Commands
    select from list by index   selenium_commands   2
    select from list by label   selenium_commands   WebElement Commands

    close browser

*** Keywords ***
set implicit wait
    set selenium implicit wait  5 seconds

open application
    open browser                ${baseUrl}  ${browser}
    maximize browser window