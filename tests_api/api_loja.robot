*** Settings ***
Library   RequestsLibrary      

*** Test Cases ***
Acesso a API
    ${response}     GET     https://serverest.dev/usuarios      

    Should Be Equal As Strings    ${response}        <Response [200]>  