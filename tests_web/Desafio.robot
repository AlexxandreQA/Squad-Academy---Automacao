*** Settings ***
Library    SeleniumLibrary
# Site Web: https://demo.automationtesting.in/Register.html


#*** Settings ***
# Site API: https://serverest.dev/?lang=pt-BR
# Site Web: https://demo.automationtesting.in/Register.html


*** Test Cases ***
Web 01
    [tags]   t1
    # 1. Abrir o navegador
    Open Browser     https://demo.automationtesting.in/Register.html    chrome
    Maximize Browser Window

    # 2. Preencher os campos (Exemplos de locatários manuais)
    Input Text      //input[@placeholder='First Name']    Alexandre
    Input Text      //input[@placeholder='Last Name']     Goncalves
    Input Text      //textarea[@ng-model='Adress']        Rua Antonia, 60
    Input Text      //input[@type='email']                alexxandre.portugal@gmail.com
    Input Text      //input[@type='tel']                  0937897743
    Click Element   //input[@value="Male"]
    Click Element   //input[@id="checkbox2"]
    Click Element    //div[@class="ui-autocomplete-multiselect ui-state-default ui-widget"]
    Click Element   //a[text()='Portuguese']
    Select From List By Label    //select[@ng-model="Skill"]   Adobe Photoshop
    Click Element                    //span[@class="select2-selection__arrow"]
    Wait Until Element Is Visible    //input[@class="select2-search__field"]    10s
    Input Text                       //input[@class="select2-search__field"]    Australia
    Press Keys                       //input[@class="select2-search__field"]    ENTER
    Select From List By Label    //select[@id="yearbox"]     1981
    Select From List By Label    //select[@placeholder="Month"]     June
    Select From List By Label    //select[@id="daybox"]     27
    Input Text    //input[@id="firstpassword"]    123456
    Input Text    //input[@id="secondpassword"]   123456
    click button   //button[@id="submitbtn"]
    sleep     5s    

     # 3. Selecionar Gênero e Hobbies
    #Click Element   //input[@value='FeMale']
    #Click Element   id:checkbox1

    # 4. Finalizar (O envio)
    # Click Button    id:submitbtn

#*** Test Cases ***
#Web 01: Realizar o preenchimento e envio do formulario
    #No Operation
    # Passos: Preencher o formulario dos campos possiveis.
    # Resultado Esperado: Validar se o envio do formulario foi realizado.  

#API 01: Cadastrar usuário com e-mail já existente    
    #No Operation
    # Passos: Tentar fazer dois POSTs seguidos com o mesmo e-mail.
    # Resultado Esperado: O segundo POST deve retornar Status 400 e a mensagem "Este email já está sendo utilizado".

#API 02: Buscar usuário por ID inexistente (Cenário de Erro)
    #No Operation
    # Passos: Fazer um GET no endpoint /usuarios/ID_QUE_NAO_EXISTE.
    # Resultado Esperado: Status 400 e a mensagem "Usuário não encontrado".  

#API 03: Fluxo de ponta a ponta (E2E) - Cadastrar e Excluir Usuário
    #No Operation
    # Passos: 01.Fazer um POST para cadastrar um usuário novo.
    # Passos: 02.Capturar o _id gerado.
    # Passos: 03.Fazer um DELETE usando esse _id.
    # Resultado Esperado: O POST deve retornar 201 e o DELETE deve retornar Status 200 com a mensagem "Registro excluído com sucesso".


*** Keywords ***
//div[@class="ui-autocomplete-multiselect ui-state-default ui-widget"]
    # TODO: implement keyword "//div[@class="ui-autocomplete-multiselect ui-state-default ui-widget"]".
    Fail    Not Implemented
