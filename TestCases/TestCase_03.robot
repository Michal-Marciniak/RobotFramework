*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${baseUrl}                  https://www.tutorialspoint.com/selenium/selenium_automation_practice.htm
${browser}                  chrome
${consentButton}            class:fc-button-label

*** Test Cases ***
CheckboxTest

    # Sets the delay that is waited after each Selenium command
    set selenium speed      0.1 seconds

    open application
    click element           ${consentButton}

    # Selecting radio buttons by (name   value)
    select radio button	    sex     Female
    select radio button	    sex     Male

    # Selecting checkboxes by (value)
    select checkbox         Manual Tester
    select checkbox         Automation Tester
    select checkbox         RC

    close browser

*** Keywords ***
open application
    open browser            ${baseUrl}  ${browser}
    maximize browser window

