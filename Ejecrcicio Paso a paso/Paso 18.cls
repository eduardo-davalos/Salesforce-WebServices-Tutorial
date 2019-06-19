string accessToken = CallRest.getAccessToken();

//LLAMADAS REST
//string resultado = CallRest.creaAccounts(accessToken, 'Broncolinnuevo', '5566666667');
//string resultado = CallRest.obtenAccounts(accessToken, '0014P000027UpHaQAK');
//string resultado = CallRest.updateAccounts('0014P0000280CP8QAM',accessToken, 'BroncolinUpdate', '5566666626');
//CallRest.deleteAccounts('0014P0000280CP8QAM',accessToken);

//LLAMADAS SOAP
//CallSOAP.SessionHeader_element acceso= new CallSOAP.SessionHeader_element();
//acceso.sessionId = accessToken;
//CallSOAP.WebServiceSO llamadasSOAP = new CallSOAP.WebServiceSO();
//llamadasSOAP.SessionHeader = acceso;
//string resultado = llamadasSOAP.creaAccount('SOAP3','5544332212');
//string resultado = llamadasSOAP.getRecord('0014P0000280ChbQAE');
//string resultado = llamadasSOAP.actualizaAccount('0014P0000280ChbQAE','SOAP3','5544332211');
//llamadasSOAP.borraAccount('0014P0000280ChbQAE');

system.debug('resultado'+resultado);
