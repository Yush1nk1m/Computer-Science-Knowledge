const express = require("express");
const PORT = process.env.PORT || 3000;
const app = express();
const idempotencyKeyStore = new Map();

app.use(express.json());

app.post("/order", (req, res) => {
    const idempotencyKey = req.headers["idempotency-key"];
    if (!idempotencyKey) {
        return res.status(400).json({ message: "An idempotency key has not been passed." });
    }

    if (idempotencyKeyStore[idempotencyKey]) {
        return res.status(200).json({
            message: "The same request has already been processed.",
            result: idempotencyKeyStore[idempotencyKey],
        });
    }

    const { items, total } = req.body;
    const order = {
        id: Math.floor(Math.random() * 1e6),
        items,
        total,
    };
    idempotencyKeyStore[idempotencyKey] = order;
    return res.status(201).json(order);
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});