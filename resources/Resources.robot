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
    ${HEADERS}     Create Dictionary       content-type=application/json
    ${RESPOSTA}    POST On Session         SwaggerAPI                        user
    ...            json=${USUARIO} 
    ...            headers=${HEADERS}
    Log            ${RESPOSTA.status_code}
