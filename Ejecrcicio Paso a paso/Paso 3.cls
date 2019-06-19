@HttpPost
    global static ID createRecord(String name, String phone) {  //Recibe 2 parametros
        //Inicializa un nuevo Objeto tipo Account
        //y le asisgna los valores de Name y Phone
        Account thisAccount = new Account(
            Name=name,
            Phone=phone);
        //inserta el objeto Account
        insert thisAccount;
        //regresa el ID
        return thisAccount.Id;
    } 