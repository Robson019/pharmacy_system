const People = require("./people");

class Admin extends People {
    constructor(name, cpf, rg, email, phone, state, city, cep, address, password) {
      super(name, cpf, email, phone, state, city, cep, address);
      this.rg = rg;
      this.password = password;
    }
  
    getRg() { return this.rg; }

    getPassword() { return this.password; }
}

module.exports = Admin