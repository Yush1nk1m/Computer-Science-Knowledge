function createReactiveObject(target, callback) {
    const proxy = new Proxy(target, {
        set(obj, prop, value) {
            if (value !== obj[prop]) {
                const prev = obj[prop];
                obj[prop] = value;
                callback(`${prop}가 [${prev}] >> [${value}]로 변경되었습니다.`);
            }
            return true;
        }
    });
    return proxy;
}

const obj = {
    "yushin": "yeonwoo",
};
const reactiveObj = createReactiveObject(obj, console.log);

reactiveObj.yushin = "choco";
reactiveObj.yushin = "yeonwoo";