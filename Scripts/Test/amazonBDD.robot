*** Settings ***
Library  Selenium2Library


*** Variables ***
${Test.URL}  https://www.amazon.ca
${Test.Browser}  chrome

*** Keywords ***
User Open test browser
    [Documentation]   user open amazon URL   ${Test.URL}  ${Test.Browser}
    open browser  ${Test.URL}   ${Test.Browser}
    sleep  6s


user verify the Main page title
   [Arguments]  ${TITLE}
  [Documentation]   user verify page tile as  ${TITLE}
   ${TITLE_new}  Get Title
   title should be   ${TITLE_new}

user enter book name in search bar
    [Arguments]  ${BOOK}
   [Documentation]   user enter book name  ${BOOK}  in search bar
    input text  //*[@id="twotabsearchtextbox"]    ${BOOK}


user click on search button
   [Documentation]   user click on search button
    click element   //input[@class='nav-input' and @value='Go']
     LOGLEVEL DEBUG
search book categoty should display
     [Arguments]  ${ITEMS}
    [Documentation]   total items diaplayed on page  ${ITEMS}
    ${count} =  GET ELEMENT COUNT   //span[@class='a-size-medium a-color-base a-text-normal']
     should be true   ${count} >= 16




*** Test Cases ***
Scenario: user should be able to search books
  Given User Open test browser
  When user verify the Main page title   'Amazon.ca: Low Prices – Fast Shipping – Millions of Items'.
  And user enter book name in search bar  python
  And user click on search button
  Then search book categoty should display  16







