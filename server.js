require("dotenv").config();

const express = require("express");
const app = express();
const cors = require("cors");

app.use(express.json());

app.use(
    cors({
        origin: "https://alvinspizzeria.netlify.app",
    })
);

const stripe = require("stripe")(process.env.STRIPE_PRIVATE_KEY);

const storeItems = new Map([
    [1, { priceInCents: 1499, name: "Pepperoni Pizza" }],
    [2, { priceInCents: 1499, name: "Supreme Pizza" }],
    [3, { priceInCents: 1499, name: "Cheese Pizza" }],
    [4, { priceInCents: 1499, name: "Vegan Pizza" }],
    [5, { priceInCents: 1499, name: "Italian Pizza" }],
    [6, { priceInCents: 1499, name: "Spicy Pizza" }],
]);

app.post("/create-checkout-session", async (req, res) => {
    const { items } = req.body;

    if (!req.body || !req.body.items || !Array.isArray(req.body.items)) {
        return res.status(400).json({ error: "Invalid request body!" });
    }

    const validItems = items.filter(item => {
        const id = parseInt(item.id);
        const quantity = parseInt(item.quantity);
        return (
            storeItems.has(id) && Number.isInteger(id) &&
            id > 0 && id < 7 && Number.isInteger(quantity) && quantity > 0 && quantity < 21
        );
    });

    if (validItems.length !== items.length) {
        return res.status(400).send('Invalid item IDs or quantities provided');
    }

    const lineItems = validItems.map(item => {
        const storeItem = storeItems.get(parseInt(item.id));
        return {
            price_data: {
                currency: "usd",
                product_data: {
                    name: storeItem.name,
                },
                unit_amount: storeItem.priceInCents,
            },
            quantity: item.quantity,
        };
    });

    try {
        const session = await stripe.checkout.sessions.create({
            payment_method_types: ["card"],
            mode: "payment",
            line_items: lineItems,
            success_url: `${process.env.CLIENT_URL}/order.html`,
            cancel_url: `${process.env.CLIENT_URL}/index.html`,
        });
        res.json({ url: session.url });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

const PORT = process.env.PORT || 3500;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});