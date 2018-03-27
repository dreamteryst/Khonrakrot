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