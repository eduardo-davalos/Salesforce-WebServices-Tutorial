//metodo que consumira REST GET, pasamos 2 parametros, el access token del login, y la account que queremos obtener
    public static string obtenAccounts(String access_token, id accountId)
    {
        //se inicia el requests
        Httprequest req1 = new HttpRequest(); 
        //se define el endpoint, concatenando como parametro la account id
        req1.setEndpoint('https://pruebasoauthlalo-dev-ed.my.salesforce.com/services/apexrest/CuentasWS/'+accountId);  
        //tipo get
        req1.setMethod('GET');    
        req1.setHeader('Content-Type','application/x-www-form-urlencoded');
        //Aqui se le pasa la autorizaci´n elacces token
        req1.setHeader('Authorization','Bearer '+access_token);     
        //se incia la llamada http
        Http http1 = new Http();
        //se recibe la respuesta de la llamada del request
        HttpResponse res1 = http1.send(req1);                 
        //se regresa el resultado
        return res1.getBody();
    }