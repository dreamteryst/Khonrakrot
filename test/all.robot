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

have name or surname only one(16)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter Name Surname.

input name just spacebar(17)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    ${SPACE}
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter Name Surname.

Citizen ID less than 13 digit(18)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   14099625
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter Citizen ID/Passport ID.

Citizen ID over 13 digit(19)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   14099625487943213333
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter Citizen ID/Passport ID.

passport id character 2 number 6 is wrong(20)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   AF123456
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter Citizen ID/Passport ID.

passport id character 2 number 8 is wrong(21)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   AF12345678
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter Citizen ID/Passport ID.

passport id character 1 number 7 is wrong(22)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   A1234567
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter Citizen ID/Passport ID.

passport id character 1 number 8 is wrong(23)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   A12345678
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter Citizen ID/Passport ID.

passport id character 9 is wrong(24)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   AFQWEASDZ
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter Citizen ID/Passport ID.

username have special alphabet(25)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    £"@somjai123
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter Username.

password less than 16 digit(26)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    123456
    Input Text    password_confirmation    123456
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Password length must more than 15.

Password do not match confirm password(27)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    1234567890abcqweq
    Input Text    password_confirmation    1234567890abcqweqaaaaaa
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Password do not match confirm password.

Email Incorrect not @(40)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    somjaigmail.com
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter email.

Email Incorrect not .com(41)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    somjai@gmail
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter email.

Email Incorrect not .com and not @(41)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    somjaigmail
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter email.

Not click I agree(42)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    click button    register
    Wait until page contains    Please agree term and condition.

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
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Capture Page Screenshot
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Please re-enter date of birth.
No name(2)
    Input Text    name    ${EMPTY}
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Name Surname is require.
No Citizen ID id(3)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${EMPTY}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Citizen ID/Passport ID is require.
No image(4)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Copy of Citizen ID/Copy of Passport ID is require.
No username(5)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${EMPTY}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Username is require.
No password(6)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${EMPTY}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Password is require.
No password confirm(7)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${EMPTY}
    Input Text    birthday    15/02/2000
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Password do not match confirm password.
No Date of birth(8)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${EMPTY}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Date of birth is require.
No email(9)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${EMPTY}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Email is require.
No Question 1(10)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    ${EMPTY}
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Question 1 is require.
No Question 2(11)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    ${EMPTY}
   Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Question 2 is require.

No Question 3(12)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
   Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    ${EMPTY}
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Question 3 is require.
No Answer 1(13)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${EMPTY}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
   Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Answer 1 is require.
No Answer 2(14)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${EMPTY}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${answer3}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Answer 2 is require.
No Answer 3(15)
    Go to    ${Home URL}
    Click link     btnRegister
    Wait until page contains    Register
    Input Text    name    @{valid name}[0] @{valid name}[1]
    Input Text    people_id   ${valid people_id}
    Choose File    id=copy    ${pathfile}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Input Text    password_confirmation    ${password}
    Input Text    birthday    ${date}
    Select From List    xpath=//select[@id="question1"]    What is your first car?
    Input Text    answer1    ${answer1}
    Select From List    xpath=//select[@id="question2"]    What is your favorite song?
    Input Text    answer2    ${answer2}
    Select From List    xpath=//select[@id="question3"]    What is your high school?
    Input Text    answer3    ${EMPTY}
    Input Text    email    ${email}
    Select Checkbox    agree
    click button    register
    Wait until page contains    Answer 3 is require.
    [Teardown]    close Browser