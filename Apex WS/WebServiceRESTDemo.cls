@RestResource(urlMapping='/CuentasWS/*')
global with sharing class WebServiceR {
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
    @HttpPost
    global static ID createRecord(String name, String phone) {  //Recibe 2 parametros
        //Inicializa un nuevo Objeto tipo Account
        //y le asisgna los valores de Name y Phone
        Account thisAccount = new Account(
            Name=name,
            Phone=phone);
        //inserta el objeto Account
        insert thisAccount;
        //regresa el ID
        return thisAccount.Id;
    }   
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
    @HttpPut
    global static ID upsertRecord(String name, String phone, String idRegistro) {
        //Inicializa un Objeto tipo Account
        //y le asisgna los valores de Name, Phone, y ID
        Account thisAccount = new Account(
            id = idRegistro,
            Name=name,
            Phone=phone);
        //upsert el objeto Account
        //Si el id es null crea un nuevo account
        //Si el id no es nulo, actualiza el account con el mismo id
        upsert thisAccount;
        //regresa el ID
        return thisAccount.Id;
    }
    @HttpPatch
    global static ID updateRecordFields() {
        //obtenermos la información del request
        RestRequest request = RestContext.request;
        //obtenermos el id del primer parametro de la url
        String recordId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        //Buscamos una cuenta con el id obtenido
        Account thisAccount = [SELECT Id FROM Account WHERE Id = :recordId];
        // Con el body del request, obtenemos los datos y los convertimos en un Map<String, Object>
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        // Iteramos a travez de cada parametro, y obtenemos su campo y su valor
        for(String fieldName : params.keySet()) {
            // Asignamos, el campo y el valor en el objeto Account
            thisAccount.put(fieldName, params.get(fieldName));
        }
        //actualizamos el account
        update thisAccount;
        //devolvemos el id del account
        return thisAccount.Id;
    }    
}