*** Settings ***
Library         SeleniumLibrary
Library         DataDriver      ../TestData/LoginDataExcel.xlsx     sheet_name=DataDriven
Resource        ../Resources/login_resources.robot
Suite Setup     open gmail
Suite Teardown  close my browsers
Test Teardown   clear email input
Test Template   Invalid Login

*** Test Cases ***
Invalid login test using email: ${email}    defaultEmail

*** Keywords ***
Invalid Login
    [Arguments]                         ${email}
    set selenium implicit wait          3
    input email                         ${email}
    click continue button
    error message should be visible
