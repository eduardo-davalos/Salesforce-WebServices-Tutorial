public static String getAccessToken(){
        //definimos los parametros que usaremos para autenticarnos
        String accessEndpoint='https://login.salesforce.com/services/oauth2/token';
        String username = 'usuariorest@cloudco.com.mx.demo'; 
        String password = 'Demo20192019';
        String securityToken= 'z9EraU98TZyhwh9KMCsYBMTPJ';
        String clientKey = '3MVG9IHf89I1t8hrJIoUMzPBE_4mIAYWOO__KNAmKMsSrGVP930AxnWcaSFaxzEt2jSaNC3PphfGV9gOUNIrx';
        String clientSecret = '106A37F28B6143FB16D4C6C60FCC5547E55B5466A4EC95A490D3BB98F1C7A9C1';
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