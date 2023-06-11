class Address {
    constructor(state, city, cep, address) {
      this.state = state;
      this.city = city;
      this.cep = cep;
      this.address = address;
    }
  
    getState() { return this.state; }

    getCity() { return this.city; }

    getCep() { return this.cep; }

    getAddress() { return this.address; }
}

module.exports = Address