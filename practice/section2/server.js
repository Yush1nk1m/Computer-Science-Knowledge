const express = require("express");
const app = express();

app.get("/", (req, res) => {
    res.json({ "a": 1 });
});

const server = app.listen(3000);
server.keepAliveTimeout = 30 * 1000;    // ms