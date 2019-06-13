global with sharing class WebServiceSO {
    webservice static String getRecord(String recordId) {
        //Query que obtiene datos de la Account buscando por id
        Account cuenta = [Select id, name, phone from Account where id =: recordId];
        return 'Id : '+cuenta.id+' Name : '+cuenta.Name+' Phone : '+cuenta.Phone;
    }
    webservice static String creaAccount(String name, String phone) {
        //inicializamos una Accont con los datos obtenidos
        Account nuevaCuenta = new Account(Name = name, phone = phone);
        //insertamos cuenta
        insert nuevaCuenta;
        //regresamos cuenta
        return nuevaCuenta.id;
    }
    webservice static String actualizaAccount(String recordId, String name, String phone) {
        //inicializamos una Account con los datos obtenidos
        Account nuevaCuenta = new Account(id=recordId, Name = name, phone = phone);
        //actualizamos cuenta
        update nuevaCuenta;
        //regresamos cuenta
        return nuevaCuenta.id;
    }
    webservice static void borraAccount(String recordId) {
        //Query que obtiene datos de la Account buscando por id
        Account borraCuenta = [Select id from Account where id =: recordId];
        //borramos cuenta
        delete borraCuenta;
    }
}