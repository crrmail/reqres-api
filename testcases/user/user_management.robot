*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}    https://reqres.in/api/users
${GET_SINGLE_USER}    9


*** Test Cases ***
Get Single User
    [Documentation]    To verify GET user profile API returns correct data when trying to get profile of existing user.
    ${response}    GET    ${URL}/${GET_SINGLE_USER}    expected_status=200

    Should Be Equal As Numbers    ${response.json()}[data][id]    ${GET_SINGLE_USER}
    Should Be Equal    ${response.json()}[data][email]    tobias.funke@reqres.in
    Should Be Equal    ${response.json()}[data][first_name]    Tobias
    Should Be Equal    ${response.json()}[data][last_name]    Funke
    Should Be Equal    ${response.json()}[data][avatar]    https://reqres.in/img/faces/9-image.jpg

