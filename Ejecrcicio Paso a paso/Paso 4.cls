@HttpDelete
    global static void deleteRecord() {
        //obtenemos la información del request
        RestRequest request = RestContext.request;
        //de la url del request obtenemos su primer parametro id.
        String recordId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        // buscamos la cuenta que tenga ese id
        Account thisAccount = [SELECT Id FROM Account WHERE Id = :recordId];
        delete thisAccount;
    }