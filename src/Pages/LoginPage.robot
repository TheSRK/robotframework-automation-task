*** Settings ***
Library     SeleniumLibrary

Resource    ../Base/BaseSetup.robot
Resource    ../Commons/CommonFeature.robot


*** Variables ***
# Login page locators

${txtEmail}     name:email
${txtPassword}      name:password
${btnLogIn}     xpath://button[contains(text(),'Log in')]
${txaInvalidEmail}      xpath://p[contains(text(),'Email is not valid')]
${txaInvaldEmainAndPassword}        xpath://div[contains(text(),'Invalid email or password')]
${txaEmptyPassword}        xpath://p[contains(text(),'Please enter your password')]
${btnDarkMode}      xpath://body/div[@id='__next']/div[1]/div[1]/button[1]
${btnLightMode}     xpath://body/div[@id='__next']/div[1]/div[1]/button[1]

######################
# Dashboard page locators
${btnProfile}       id:composition-button
${mnuLogout}        id:composition-menu
${tblData}      xpath://body/div[@id='__next']/div[1]/div[2]/div[1]/div[2]
${txtSearch}        xpath://input[@id='search-input']
${searchString}     Lannister
${searchResult}     xpath://div[@data-field="lastName"]//div[contains(text(), "Lannister")]

# username and pwd
#${username}     admin@email.com
#${password}     thisisverysecure
#${invalidUsername}     admin
#${invalidPassword}     thisisverysecur

# test config


#*** Test Cases ***
#
## launching browser and visiting url
#Launch Browser
#    open browser    ${url}      ${browser}
#    maximize browser window
#    wait until element is visible    ${txaWelcome}
#    set selenium speed    1

# make dark mode
#Test Dark Mode
#    CommonFeature.ChangeViewMode    ${btnlightmode}
## make light mode
#Test Dark Mode
#    CommonFeature.ChangeViewMode    ${btnDarkMode}

## empty credentials login attempt
#Empty Login Credential
#    EmptyEmailAndPasswordLogin      ${EMPTY}        ${EMPTY}
#
## wrong email and right password
#Wrong Email and Right Password using ${invalidUsername} and ${password}
#    InavlidEmailLogin    ${invalidUsername}       ${password}
#
## right email and wrong password
#Right Email and Wrong Passoword using ${username} and ${invalidPassword}
#    InavlidPasswordLogin    ${username}       ${invalidPassword}

# valid email and valid password
#Valid Email and Password using ${username} and ${password}


#Search Table Data
#    Search    ${txtSearch}      ${searchString}     ${searchresult}

#######################
# Dashboard page
#Logout from Dashbord
#    Logout    ${btnprofile}     ${mnulogout}        ${txaWelcome}




## closing current browser
#Tear Down
#    close browser


*** Keywords ***

#ValidLogin
#    [Arguments]    ${username}      ${password}
#    input text      ${txtEmail}       ${username}
#    input password    ${txtpassword}        ${password}
#    click button    ${btnlogin}

EmptyEmailAndPasswordLogin
    [Arguments]    ${username}      ${password}
    input text      ${txtEmail}       ${username}
    input password    ${txtpassword}        ${password}
    click button    ${btnlogin}
    wait until element is visible    ${txaInvalidEmail}
    wait until element is visible    ${txaEmptyPassword}

InavlidEmailLogin
    [Arguments]    ${username}      ${password}
    input text      ${txtEmail}       ${username}
    input password    ${txtpassword}        ${password}
    click button    ${btnlogin}
    wait until element is visible    ${txaInvalidEmail}

InavlidPasswordLogin
    [Arguments]    ${username}      ${password}
    input text      ${txtEmail}       ${username}
    input password    ${txtpassword}        ${password}
    click button    ${btnlogin}
    wait until element is visible    ${txaInvaldEmainAndPassword}



##################
# dashboard page keywords

Search
    [Arguments]    ${searchBox}     ${searchString}     ${element}
    wait until element is visible       ${searchBox}
    wait until element is enabled    ${searchBox}
    click element    ${searchBox}
    input text    ${searchBox}      ${searchString}
    wait until element is visible    ${element}

Logout
    [Arguments]    ${profile}       ${logout}       ${element}
    click button    ${profile}
    click element    ${logout}
    wait until element is visible       ${element}