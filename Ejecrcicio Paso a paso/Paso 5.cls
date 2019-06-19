@HttpPut
    global static ID upsertRecord(String name, String phone, String idRegistro) {
        //Inicializa un Objeto tipo Account
        //y le asisgna los valores de Name, Phone, y ID
        Account thisAccount = new Account(
            id = idRegistro,
            Name=name,
            Phone=phone);
        //upsert el objeto Account
        //Si el id es null crea un nuevo account
        //Si el id no es nulo, actualiza el account con el mismo id
        upsert thisAccount;
        //regresa el ID
        return thisAccount.Id;
    }