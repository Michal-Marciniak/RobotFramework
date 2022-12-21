*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}              https://www.google.pl/?gws_rd=ssl
${browser}          chrome
${acceptAllButton}  xpath://div[text()="Zaakceptuj wszystko"]
${emailInput}       id:identifierId
${continueButton}   xpath://span[text()="Dalej"]
${errorMessage}     css:div.o6cuMc


*** Keywords ***
open my browser
    open browser                ${url}    ${browser}
    maximize browser window
    accept terms

close my browsers
    close all browsers

accept terms
    click element               ${acceptAllButton}

open gmail
    open my browser
    click link                  Gmail

input email
    [Arguments]                 ${email}
    input text                  ${emailInput}   ${email}

clear email input
    input text                  ${emailInput}   ${EMPTY}    True

click continue button
    click element               ${continueButton}

error message should be visible
    ${errorMessageText}=        get text    ${errorMessage}
    IF          ${errorMessageText} == Wpisz prawidłowy adres e-mail lub numer telefonu
        page should contain     Wpisz prawidłowy adres e-mail lub numer telefonu
    ELSE IF     ${errorMessageText} == Nie możemy znaleźć takiego konta Google
        page should contain     Nie możemy znaleźć takiego konta Google
    END