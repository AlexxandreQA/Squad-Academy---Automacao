*** Settings ***
Library   RequestsLibrary  
Library   Collections    

*** Test Cases ***
Acesso a API
    ${response}     GET     https://serverest.dev/usuarios      

    Should Be Equal As Strings    ${response}        <Response [200]>  


*** test Cases ***
Desafio API1
    [tags]    all
    
    ${dados_usuario}    Create Dictionary    nome=Alexandre    email=portugal52@gmail.com    password=teste    administrador=true
    ${response}    POST    url=https://serverest.dev/usuarios    json=${dados_usuario}    expected_status=201
    Status Should Be    201    ${response}
    Log To Console      Usuário criado com sucesso!
    ${dados_usuario}    Create Dictionary    nome=Alexandre    email=portugal52@gmail.com    password=teste    administrador=true
    ${response}    POST    url=https://serverest.dev/usuarios    json=${dados_usuario}    expected_status=400
    Dictionary Should Contain Value    ${response.json()}    Este email já está sendo usado
    Log To Console      Validação de usuário duplicado funcionou!
    
Desafio API2
    [tags]    all
    
    ${dados_usuario}    Create Dictionary    nome=Alexandre    email=portugal52@gmail.com    password=teste    administrador=true   _id=0uxuPY0cbmQhpEz1
    ${response}    GET    https://serverest.dev/usuarios/0uxuPY0cbmQhpEz1    json=${dados_usuario}    expected_status=400
    Log To Console        Usuário não encontrado

    
Desafio API3
    [tags]    all
    &{body}  Create Dictionary   nome=Alexandre       email=alexandre.carinola52@gmail.com    password=teste    administrador=true
    
    ${response}   POST     https://serverest.dev/usuarios      json=${body}


    Should Be Equal As Strings    ${response}            <Response [201]>
    Log To Console                ${response.json()}

    ${id_gerado}    Set Variable    ${response.json()['_id']}
    Log To Console    O ID capturado foi: ${id_gerado}

    ${response}   DELETE      https://serverest.dev/usuarios/${id_gerado}    json=${body}    expected_status=200    
    Log To Console    Registro excluído com sucesso!    

    #API 03: Fluxo de ponta a ponta (E2E) - Cadastrar e Excluir Usuário
    #No Operation
    # Passos: 01.Fazer um POST para cadastrar um usuário novo.
    # Passos: 02.Capturar o _id gerado.
    # Passos: 03.Fazer um DELETE usando esse _id.
    # Resultado Esperado: O POST deve retornar 201 e o DELETE deve retornar Status 200 com a mensagem "Registro excluído com sucesso".
   

    #${response}    POST    https://serverest.dev/usuarios
    #${dados_usuario}    Create Dictionary    nome=Alexandre    email=alexxandre.portugal@gmail.com    password=teste    administrador=false
    #should Be Equal As Strings    ${response}        <Response [400]>