//metodo que consumira REST DELETE, pasamos 2 parametros, id, access_token 
    public static void deleteAccounts(id idRegistro, String access_token)
    {
        //se inicia el requests
        Httprequest req1 = new HttpRequest(); 
        //se define el endpoint, concatenando como parametro la account id
        req1.setEndpoint('https://pruebasoauthlalo-dev-ed.my.salesforce.com/services/apexrest/CuentasWS/'+idRegistro);  
        //tipo DELETE
        req1.setMethod('DELETE');  
        //el contenido sera JSON
        req1.setHeader('Content-Type', 'application/json;charset=UTF-8');
        //Aqui se le pasa la autorización elacces token
        req1.setHeader('Authorization','Bearer '+access_token);   
        //se incia la llamada http
        Http http1 = new Http();
        //se recibe la respuesta de la llamada del request
        http1.send(req1);                 
    }