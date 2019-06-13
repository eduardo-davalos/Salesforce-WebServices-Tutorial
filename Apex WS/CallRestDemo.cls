public class CallRest {
    public static String getAccessToken(){
        //definimos los parametros que usaremos para autenticarnos
        String accessEndpoint='https://login.salesforce.com/services/oauth2/token';
        String username = '***********'; 
        String password = '***********';
        String securityToken= '**********';
        String clientKey = '**********';
        String clientSecret = '***********';
        String Access_Token = '';
    
        //iniciamos Un request que usaremos para hacer una llamada REST POST al endpoint de login
        Httprequest req = new HttpRequest();    
        req.setMethod('POST');    
        //En el body del request definimos los parametros de autenticación
        req.setBody('grant_type=password + &client_id=' + clientKey + '&client_secret=' + clientSecret + '&username=' + 
                    username +'&password=' + password+securityToken); 
        //agregamos el endpoint al request
        req.setEndpoint(accessEndpoint);
       
        //Iniciamos la llamada
        Http http = new Http();
        //definimos la respuesta donde se guardara
        HttpResponse res;       
        try {
            //en la respuesta se guardara , el envio del request por http
            res = http.send(req);  
            //Se obtiene la respuesta en JSON
            JSONParser parser = JSON.createParser(res.getBody());
            //Se lee el JSON navegando por cada token
            while (parser.nextToken() != null) {
                //al encontrar el access_token
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'access_token')) {
                    parser.nextToken();
                    //se asigna el access token a la variable
                    Access_Token = parser.getText();    
                } 
            }            
        }catch(system.CalloutException e){   
            //si hubo error de callout se guarda
            Access_Token = 'Error '+e;
        }
        //devolvemos el resultado.
        return Access_Token;
    }
    
    //metodo que consumira REST GET, pasamos 2 parametros, el access token del login, y la account que queremos obtener
    public static string obtenAccounts(String access_token, id accountId)
    {
        //se inicia el requests
        Httprequest req1 = new HttpRequest(); 
        //se define el endpoint, concatenando como parametro la account id
        req1.setEndpoint('https://**********.my.salesforce.com/services/apexrest/CuentasWS/'+accountId);  
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
    
    //metodo que consumira REST POST, pasamos 3 parametros,Access token, el Name y el phone
    public static string creaAccounts(String access_token, string name, string phone)
    {
        //se inicia el requests
        Httprequest req1 = new HttpRequest(); 
        //se define el endpoint, concatenando como parametro la account id
        req1.setEndpoint('https://**********.my.salesforce.com/services/apexrest/CuentasWS/');  
        //tipo POST
        req1.setMethod('POST');  
        //el contenido sera JSON
        req1.setHeader('Content-Type', 'application/json;charset=UTF-8');
        //Aqui se le pasa la autorizaci´n elacces token
        req1.setHeader('Authorization','Bearer '+access_token);   
        //Le pasamos los parametros en JSON al Body
        req1.setBody('{"name":"'+name+'","phone":"'+phone+'"}'); 
        //se incia la llamada http
        Http http1 = new Http();
        //se recibe la respuesta de la llamada del request
        HttpResponse res1 = http1.send(req1);                 
        //se regresa el resultado
        return res1.getBody();
    }
    
    //metodo que consumira REST PUT, pasamos 4 parametros, id, access_token , el Name y el phone
    public static string updateAccounts(id idRegistro, String access_token, string name, string phone)
    {
        //se inicia el requests
        Httprequest req1 = new HttpRequest(); 
        //se define el endpoint, concatenando como parametro la account id
        req1.setEndpoint('https://*******.my.salesforce.com/services/apexrest/CuentasWS/');  
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
    
    //metodo que consumira REST DELETE, pasamos 2 parametros, id, access_token 
    public static void deleteAccounts(id idRegistro, String access_token)
    {
        //se inicia el requests
        Httprequest req1 = new HttpRequest(); 
        //se define el endpoint, concatenando como parametro la account id
        req1.setEndpoint('https://******.my.salesforce.com/services/apexrest/CuentasWS/'+idRegistro);  
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
}
