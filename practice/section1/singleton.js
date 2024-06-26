class Singleton {
    constructor() {
        if (!Singleton.instance) {
            Singleton.instance = this;
        }
        return Singleton.instance;
    }

    getInstance() {
        return this;
    }
}

const obj1 = new Singleton();
const obj2 = new Singleton();

console.log(obj1 === obj2);