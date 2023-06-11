class Medicine {
    constructor(id, coName, cheName, type, form, recipe, stripe, price, quantity, observation) {
      this.id = id;
      this.coName = coName;
      this.cheName = cheName;
      this.type = type;
      this.form = form;
      this.recipe = recipe;
      this.stripe = stripe;
      this.price = price;
      this.quantity = quantity;
      this.observation = observation;
    }

    getId() { return this.id; }
  
    getCoName() { return this.coName; }

    getCheName() { return this.cheName; }

    getType() { return this.type; }

    getForm() { return this.form; }

    getCoRecipe() { return this.recipe; }

    getStripe() { return this.stripe; }

    getPrice() { return this.price; }

    getQuantity() { return this.quantity; }

    getObservation() { return this.observation }

    setObservation() {
      this.observation = "SEM OBSERVAÇÕES";
    }
}

module.exports = Medicine