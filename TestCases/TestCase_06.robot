*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${baseUrl}                  https://testautomationpractice.blogspot.com/
${browser}                  chrome
${promptAlertButton}        css:[onclick="myFunction()"]

*** Test Cases ***
HandlingAlertsTest

    # setting implicit wait
    set selenium implicit wait  5 seconds   # default 0 seconds

    open application

    click prompt alert

    close browser

*** Keywords ***
open application
    open browser                ${baseUrl}  ${browser}
    maximize browser window

click prompt alert
    click element               ${promptAlertButton}
    ${alertMessage}=            handle alert    # store alert's message in alertMessage variable
    sleep                       2 seconds
    log to console              ${alertMessage}

    click element               ${promptAlertButton}
    ${alertMessage}=            handle alert    dismiss
    sleep                       2 seconds
    log to console              ${alertMessage}

    click element               ${promptAlertButton}
    alert should be present     Press a button!     # verify if alert's message equals Press a button! and accept it
