@HttpGet
    global static Account getRecord() {
        RestRequest request = RestContext.request;
        // Obten el ID del registro desde la URL donde se llama el WS
        String idResgistro = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        //busca una cuenta basandose en el id obtenido
        Account result =  [SELECT Id, Name, Phone
                        FROM Account
                        WHERE Id = :idResgistro];
        //devuelve la cuenta con su infomacion de Id, Name y Phone
        return result;
    }