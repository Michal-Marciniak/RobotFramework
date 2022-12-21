*** Settings ***
Library  DatabaseLibrary
Library  OperatingSystem    # used for acsess operating system variables

Suite Setup     Connect To Database     ${dbApiModuleName}  ${dbName}   ${dbUsername}   ${dbPassword}   ${dbHost}   ${dbPort}
Suite Teardown  Disconnect From Database

*** Variables ***
${dbApiModuleName}      pymysql
${dbName}               testdb
${dbUsername}           root
${dbPassword}           root
${dbHost}               localhost
${dbPort}               3306

${tableName}            persons

*** Test Cases ***
Create table persons
    Create table                    ${tableName}

Insert multiple data into table
    Insert multiple data into table

Insert single data into table
    Insert single data into table   ${tableName}    6   "Jerzy"    "Kowalski"

*** Keywords ***
Create table
    [Arguments]                 ${tableName}
    ${output}=                  Execute SQL String  Create table ${tableName}(id integer, first_name varchar(20), last_name varchar(20));
    should be equal as strings  ${output}   None

Insert single data into table
    # Inserting Single Record
    [Arguments]                 ${tableName}    ${id}   ${firstName}    ${lastName}
    ${output}=                  Execute SQL String  Insert into ${tableName} values(${id}, ${firstName}, ${lastName});
    should be equal as strings  ${output}   None

Insert multiple data into table
    # Inserting Multiple Records
    ${output}=                  Execute SQL Script  ./TestData/testdb_persons_insertData.sql
    should be equal as strings  ${output}   None
