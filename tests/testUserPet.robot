*** Settings ***
Resource           ../resources/Resources.robot
Test Setup         Conectar API

*** Test Cases ***

Cadastrar um novo usuário
    Cadastrar um novo usuario User2
    #Conferir o status code "200"
    #Conferir reason "Ok"
    #Conferir dados do "usuario"