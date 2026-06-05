*** Settings ***
Library  SeleniumLibrary 

*** Test Cases ***

Valida login
    # Abre o Chrome
    Open Browser    https://www.saucedemo.com/    Chrome

    # Adiciona o logine e a senha e clica no botao Login
    Input Text      //input[@id="user-name"]      standard_user 
    Input Text      //input[@id="password"]       secret_sauce 
    Click Element   //input[@id="login-button"] 

    # Valida se está logado na pagina
    Element Should Contain    //div[@class="app_logo"]        Swag Labs
	
		