webservice static String getRecord(String recordId) {
        //Query que obtiene datos de la Account buscando por id
        Account cuenta = [Select id, name, phone from Account where id =: recordId];
        return 'Id : '+cuenta.id+' Name : '+cuenta.Name+' Phone : '+cuenta.Phone;
    }