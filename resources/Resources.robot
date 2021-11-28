*** Settings ***
Library        RequestsLibrary
Library        Collections
Library        JSONLibrary



*** Variables ***
${URL}         https://petstore.swagger.io/v2/

*** Keywords ***
Conectar API
    Create Session    SwaggerAPI    ${URL}


Cadastrar um novo usuario ${USER}

    ${USUARIO}      Load JSON From File     ./resources/${USER}.json
    ${HEADERS}     Create Dictionary        content-type=application/json
    ${RESPOSTA}    POST On Session          SwaggerAPI                        user
    ...            json=${USUARIO} 
    ...            headers=${HEADERS}
    Set Test Variable                       ${RESPOSTA}


# CONFERENCIAS #

Conferir o status code ${STATUS_CODE_ESPERADO}
    Should Be Equal As Strings              ${RESPOSTA.status_code}           ${STATUS_CODE_ESPERADO}

Conferir reason ${REASON_ESPERADO}
    Should Be Equal As Strings              ${RESPOSTA.reason}                ${REASON_ESPERADO}

Conferir o body da resposta
    Should Be Equal As Strings              ${RESPOSTA.json()["message"]}      9223372036854775807
    Should Be Equal As Strings              ${RESPOSTA.json()["code"]}         200
    Should Be Equal As Strings              ${RESPOSTA.json()["type"]}         unknown