*** Settings ***
Library    Selenium2Library

*** Variables ***
${BROWSER}        Chrome
${Home URL}    http://localhost:4200/
${REG URL}    http://localhost:4200/register
@{valid name}    somjai    jaidee
${valid people_id}    1409962548794
${valid passport id}    AF1234567
${pathfile}    ${CURDIR}/test.png
${username}    somjai123
${password}    1234567890abcqweq
${date}    15/02/1997
${answer1}    BMW
${answer2}    with you
${answer3}    tonrose school
${email}    somjai@gmail.com
${sleep}    sleep    5s
*** Testcases ***
Open Register Page(1)
    Open Browser    ${Home URL}    ${BROWSER}
    Click link     btnRegister
    Wait until page contains    Register
Date format error y/m/d(28)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    1997/02/15
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
Date format error y/d/m(29)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    1997/15/02
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
Date format error m/d/y(30)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    02/15/1997
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
Date format error m/y/d(31)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    02/1997/15
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
Date format error d/y/m(32)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    15/1997/02
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
Date format error Day over(33)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    34/02/1997
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
Date format error Month over(34)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    15/13/1997
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
Date format error year over(34)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    15/02/2000
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
Date format error february day over(35)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    30/02/1997
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
Date format error day overspend(36)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    -15/02/1997
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
Date format error month overspend(36)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    15/-2/1997
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
Date format error year overspend(37)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    15/02/-1997
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
Date format error(38)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    15-02*1997
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
Date format error year less than 1970(39)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    15/02/1960
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
    [Teardown]    close Browser
