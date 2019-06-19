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