const Address = require("./address");

class People extends Address {
    constructor(name, cpf, email, phone, state, city, cep, address) {
      super(state, city, cep, address);
      this.name = name;
      this.cpf = cpf;
      this.email = email;
      this.phone = phone;
    }
  
    getName() { return this.name; }

    getCpf() { return this.cpf; }

    getEmail() { return this.email; }

    getPhone() { return this.phone; }
}

module.exports = People
  
//   const pessoa1 = new People("João", "12345678901", "pessoa@gmail.com", "82999999999", "AL", "Arapiraca", "99999999", "Rua tal 345");
//   pessoa1.getName(); // João
  