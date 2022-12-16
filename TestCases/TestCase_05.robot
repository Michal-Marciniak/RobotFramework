*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${baseUrl}                  https://demowebshop.tricentis.com/
${browser}                  chrome
${registerLink}             css:a[href="/register"]
${registerButton}           id:register-button

*** Test Cases ***
RegistrationTest

    # setting implicit wait
    set selenium implicit wait  5 seconds   # default 0 seconds

    open application

    register

    close browser

*** Keywords ***
open application
    open browser                ${baseUrl}  ${browser}
    maximize browser window

register
    click element               ${registerLink}
    set selenium timeout        10 seconds          # set specified timeout only for next command
                                                    # default selenium timeout is 5 seconds
                                                    # it is similar
    wait until page contains    Register            # wait for text Register maximum for 5 seconds
    select radio button         Gender  M
    input text                  id:FirstName        Michal
    input text                  id:LastName         Marciniak
    input text                  id:Email            test@test.com
    input text                  id:Password         test1234
    input text                  id:ConfirmPassword  test1234
    click element               ${registerButton}