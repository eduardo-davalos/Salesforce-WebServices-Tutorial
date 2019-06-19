//metodo que consumira REST PUT, pasamos 4 parametros, id, access_token , el Name y el phone
    public static string updateAccounts(id idRegistro, String access_token, string name, string phone)
    {
        //se inicia el requests
        Httprequest req1 = new HttpRequest(); 
        //se define el endpoint, concatenando como parametro la account id
        req1.setEndpoint('https://pruebasoauthlalo-dev-ed.my.salesforce.com/services/apexrest/CuentasWS/');  
        //tipo PUT
        req1.setMethod('PUT');  
        //el contenido sera JSON
        req1.setHeader('Content-Type', 'application/json;charset=UTF-8');
        //Aqui se le pasa la autorización elacces token
        req1.setHeader('Authorization','Bearer '+access_token);   
        //Le pasamos los parametros en JSON al Body
        req1.setBody('{"idRegistro":"'+idRegistro+'","name":"'+name+'","phone":"'+phone+'"}'); 
        //se incia la llamada http
        Http http1 = new Http();
        //se recibe la respuesta de la llamada del request
        HttpResponse res1 = http1.send(req1);                 
        //se regresa el resultado
        return res1.getBody();
    }