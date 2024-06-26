class NonSingleton {
    constructor() {
        this.name = "yushin";
        this.born = 2001;
        this.height = 165;
    }
}

const obj1 = new NonSingleton();
const obj2 = new NonSingleton();

console.log(obj1 === obj2);