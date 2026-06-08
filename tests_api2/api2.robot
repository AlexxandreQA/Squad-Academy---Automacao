*** Settings ***
Library  RequestsLibrary      

*** Test Cases ***
Valida se as requisições estao ativas
   ${response}   GET     https://serverest.dev/usuarios     verify=${FALSE}
  
   Should Be Equal As Strings    ${response}        <Response [200]>  
   Should Not Be Empty           ${response.json()}[usuarios][1][nome]
   Log to console                ${response.json()}[usuarios][2][nome]


Teste POST
    &{body}  Create Dictionary  nome=Renan   email=Renan@qa.com.br   password=teste    administrador=true
    
    ${response}   POST     https://serverest.dev/usuarios  json=${body}   verify=${FALSE}   

    Should Be Equal As Strings    ${response}            <Response [201]>
    Log To Console                ${response.json()}

    ${response}   GET      https://serverest.dev/usuarios/0uxuPY0cbmQhpEz1

