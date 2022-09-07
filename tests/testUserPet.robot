*** Settings ***
Resource           ../resources/Resources.robot
Test Setup         Conectar API


*** Variables ***
${NOME_USUARIO}        Tone


*** Test Cases ***

Cadastrar um novo usuário
    [Tags]        POST
    Cadastrar um novo usuario ${NOME_USUARIO}
    Conferir o status code 200
    Conferir reason OK
    Conferir o body da resposta

Consultar um usuário 
    [Tags]        GET
    Consultar um usuário ${NOME_USUARIO}
    Conferir o status code 200
    Conferir reason OK
    Conferir resposta do body ${NOME_USUARIO}

Alterar um usuário 
    [Tags]        PUT
    Alterar um usuário ${NOME_USUARIO}
    Conferir o status code 200
    Conferir reason OK
    Conferir o body da resposta

# Deletar um usuário 
#     [Tags]        DEL
#     Deletar um usuário ${NOME_USUARIO}
#     Conferir o status code 200
#     Conferir reason OK
#     Conferir o body da resposta
