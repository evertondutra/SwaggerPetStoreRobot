*** Settings ***
Library        RequestsLibrary
Library        Collections


*** Variables ***
${URL}         https://petstore.swagger.io/v2/
&{USER1}       id=0
...    username=Tone
...    firstName=Everton
...    lastName=Dutra
...    email=everton@dutra.com
...    password=654321
...    phone=11122233
...    userStatus=1

*** Keywords ***
Conectar API
    Create Session    SwaggerAPI    ${URL}


Cadastrar um novo "usuario"
    ${HEADERS}     Create Dictionary       content-type=application/json
    ${RESPOSTA}    POST On Session         SwaggerAPI                        user
    ...            json=${USER1}
    ...            headers=${HEADERS}
    Log            ${RESPOSTA}
