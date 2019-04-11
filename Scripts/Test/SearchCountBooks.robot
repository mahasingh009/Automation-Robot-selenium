*** Settings ***
Library  SeleniumLibrary
# Library  Selenium2Library




*** Variables ***
${Test.URL}  https://www.amazon.ca
${Test.Browser}  chrome

*** Keywords ***
User Open test browser
    [Documentation]   user open amazon URL   ${Test.URL}  ${Test.Browser}
    open browser  ${Test.URL}   ${Test.Browser}
    sleep  5s
    maximize browser window

Search book name
  [Arguments]  ${itemName}
  input text   id=twotabsearchtextbox    ${itemName}
  click element  //input[@class='nav-input' and @value='Go']
   sleep  6s

Count total books displayed on each page
   ${count} =  Get Element Count    //span[@class='a-size-medium a-color-base a-text-normal']
   should be true   ${count} >= 16


*** Test Cases ***
User go to amazon site
    User Open test browser
    Search book name   python books
    Count total books displayed on each page















