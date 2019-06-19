@RestResource(urlMapping='/CuentasWS/*')
global with sharing class WebServiceR {
    @HttpGet
    global static Account getRecord() {
        //code here
    }
    @HttpPost
    global static ID createRecord(String name, String phone) {  //Recibe 2 parametros
        //code here
    }   
    @HttpDelete
    global static void deleteRecord() {
        //code here
    }
    @HttpPut
    global static ID upsertRecord(String name, String phone, String idRegistro) {
        //code here
    }
    @HttpPatch
    global static ID updateRecordFields() {
        //code here
    }    
}