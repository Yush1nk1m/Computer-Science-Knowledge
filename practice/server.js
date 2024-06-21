const express = require("express");
const fs = require("fs");
const app = express();
const port = 3000;

app.get("/", (req, res) => {
    const file = JSON.parse(fs.readFileSync("info.json", { encoding: "utf-8" }));
    const data = {
        "name": file.name,
    };

    res.send(data);
});

app.listen(port, () => {
    console.log(`http://127.0.0.1:${port}`);
});