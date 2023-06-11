const People = require('./people');

class Professional extends People {
    constructor(name, cpf, role, phone, state, city, cep, address, email, salary) {
      super(name, cpf, email, phone, state, city, cep, address);
      this.role = role;
      this.salary = salary;
    }
  
    getRole() { return this.role; }

    getSalary() { return this.salary; }
}

module.exports = Professional