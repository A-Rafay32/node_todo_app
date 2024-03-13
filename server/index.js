const express = require('express');
const mongoose = require("mongoose");

const authRouter = require('./routes/auth');
const PORT = 3000;
const app = express();

//middlewares
app.use(authRouter);

//connections
mongoose.connect().then(() => console.log("Connection Succesful")).catch((e) => console.log(e));

app.get("/api/sign-up", (req, res) => {
    const { name, email, password } = req.body;


});
app.listen(PORT, "0.0.0.0", () => {
    console.log("connected at port" + PORT);
});