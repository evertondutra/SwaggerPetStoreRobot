*** Settings ***
Resource           ../resources/Resources.robot
Test Setup         Conectar API


*** Variables ***
${USUARIO}        Edu


*** Test Cases ***

Cadastrar um novo usuário
    [Tags]        POST
    Cadastrar um novo usuario ${USUARIO}
    Conferir o status code 200
    Conferir reason OK
    Conferir o body da resposta

Consultar um usuário 
    [Tags]        GET
    Consultar um usuário ${USUARIO}
    Conferir o status code 200
    Conferir reason OK
    Conferir resposta do GET do usuário ${USUARIO}