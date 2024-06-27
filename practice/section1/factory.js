class CoffeeFactory {
    static createCoffee(type) {
        const factory = factoryList[type];
        return factory.createCoffee();
    }
}

class Latte {
    constructor() {
        this.name = "latte";
    }
}

class Espresso {
    constructor() {
        this.name = "espresso";
    }
}

class LatteFactory extends CoffeeFactory {
    static createCoffee() {
        return new Latte();
    }
}

class EspressoFactory extends CoffeeFactory {
    static createCoffee() {
        return new Espresso();
    }
}

const factoryList = { LatteFactory, EspressoFactory };

const coffee = CoffeeFactory.createCoffee("LatteFactory");
console.log(coffee.name);