const express = require("express");
const app = express();
const path = require("path");

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "cache.html"));
});

const server = app.listen(3000);
server.keepAliveTimeout = 30 * 1000;    // ms