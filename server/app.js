const express = require('express');
const mongoose = require("mongoose");
const authRouter = require('./routes/auth_router');
const taskRouter = require('./routes/task_router');
const notesRouter = require('./routes/notes_router');



// constants
const PORT = 3000;
const DB = "mongodb+srv://abdulrafaychohan986:zC98H8m7irdgkRgU@cluster0.dmrh9vi.mongodb.net/";
const app = express();

//routes
app.use(express.json());
app.use("/auth", authRouter);
app.use("/task", taskRouter);
app.use("/notes", notesRouter);

//connections
mongoose.connect(DB).then(() => console.log("Connection Succesful")).catch((e) => console.log(e));



app.listen(PORT, "0.0.0.0", () => {
    console.log("connected at port" + PORT);
});

