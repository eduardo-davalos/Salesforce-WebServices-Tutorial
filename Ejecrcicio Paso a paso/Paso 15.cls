webservice static String creaAccount(String name, String phone) {
        //inicializamos una Accont con los datos obtenidos
        Account nuevaCuenta = new Account(Name = name, phone = phone);
        //insertamos cuenta
        insert nuevaCuenta;
        //regresamos cuenta
        return nuevaCuenta.id;
    }