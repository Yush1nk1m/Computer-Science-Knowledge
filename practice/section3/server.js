const express = require("express");
const NodeCache = require("node-cache");

const app = express();
const cache = new NodeCache();
const obj = {
    "userId": 1,
    "id": 1,
    "title": "hello world!",
    "completion": false,
};

app.get("/data", (req, res) => {
    const value = cache.get("data");

    if (value) {
        console.log("Request has been cached. Respond the cached data.");
        return res.json(value);
    } else {
        console.log("Request has not been cached. Update the cache and respond.");
        setTimeout(() => {
            cache.set("data", obj);
            return res.json(obj);
        }, 2000);
    }
});

app.listen(3000, () => {
    console.log("Cache server is running on http://locahost:3000");
})