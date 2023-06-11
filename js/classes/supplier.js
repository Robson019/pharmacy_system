const People = require('./people');

class Supplier extends People {
    constructor(name, cnpj, tradeRep, email, phone, state, city, cep, address, observation) {
      super(name, cnpj, email, phone, state, city, cep, address);
      this.tradeRep = tradeRep;
      this.observation = observation;
    }

    getTradeRep() { return this.tradeRep; }

    getObservation() { return this.observation }

    setObservation() {
      this.observation = "SEM OBSERVAÇÕES";
    }
}

module.exports = Supplier