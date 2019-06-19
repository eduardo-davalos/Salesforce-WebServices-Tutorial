webservice static void borraAccount(String recordId) {
        //Query que obtiene datos de la Account buscando por id
        Account borraCuenta = [Select id from Account where id =: recordId];
        //borramos cuenta
        delete borraCuenta;
    }