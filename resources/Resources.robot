*** Settings ***
Library        RequestsLibrary
Library        Collections
Library        JSONLibrary



*** Variables ***
${URL}         https://petstore.swagger.io/v2/

*** Keywords ***
Conectar API
    Create Session    SwaggerAPI    ${URL}


## POST ##
Cadastrar um novo usuario ${USER}

    ${USUARIO}     Load JSON From File      ./resources/${USER}.json
    ${HEADERS}     Create Dictionary        content-type=application/json
    ${RESPOSTA}    POST On Session          SwaggerAPI                        user
    ...            json=${USUARIO} 
    ...            headers=${HEADERS}
    Set Test Variable                       ${RESPOSTA}


## GET ##
Consultar um usuário ${USERNAME}
    ${RESPOSTA}    GET On Session          SwaggerAPI                        user/${USERNAME}
    Set Test Variable    ${RESPOSTA}


# CONFERENCIAS #

Conferir o status code ${STATUS_CODE_ESPERADO}
    Should Be Equal As Strings              ${RESPOSTA.status_code}           ${STATUS_CODE_ESPERADO}

Conferir reason ${REASON_ESPERADO}
    Should Be Equal As Strings              ${RESPOSTA.reason}                ${REASON_ESPERADO}

Conferir o body da resposta
    Should Be Equal As Strings              ${RESPOSTA.json()["message"]}      9223372036854775807
    Should Be Equal As Strings              ${RESPOSTA.json()["code"]}         200
    Should Be Equal As Strings              ${RESPOSTA.json()["type"]}         unknown

Conferir resposta do GET do usuário ${USER}
    ${USUARIO}     Load JSON From File      ./resources/${USER}.json
    Should Not Be Empty                     item                     ${RESPOSTA.json()}[id]
    Dictionary Should Contain Item          ${RESPOSTA.json()}       username         ${USUARIO}[username]
    Dictionary Should Contain Item          ${RESPOSTA.json()}       lastName         ${USUARIO}[lastName]
    Dictionary Should Contain Item          ${RESPOSTA.json()}       email            ${USUARIO}[email]