const express = require("express");
const Notes = require("../models/notes");
const notesRouter = express.Router();
const auth = require("../middlewares/auth");


// SIGN UP
notesRouter.post("/api/create/notes", auth, async (req, res) => {
    try {
        const { title, description, priority } = req.body;

        const existingNote = await User.findOne({ title });
        if (existingNote) {
            return res
                .status(400)
                .json({ msg: "Note with same title already exists!" });
        }

        let note = new Notes({
            title: title,
            description: description,
            priority: priority,
            status: false
        });
        note = await note.save();
        res.json(note);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// // Sign In Route
// authRouter.post("/api/signin", async (req, res) => {
//     try {
//         const { email, password } = req.body;

//         const user = await User.findOne({ email });
//         if (!user) {
//             return res
//                 .status(400)
//                 .json({ msg: "User with this email does not exist!" });
//         }

//         const isMatch = await bcryptjs.compare(password, user.password);
//         if (!isMatch) {
//             return res.status(400).json({ msg: "Incorrect password." });
//         }

//         const token = jwt.sign({ id: user._id }, "passwordKey");
//         res.json({ token, ...user._doc });
//     } catch (e) {
//         res.status(500).json({ error: e.message });
//     }
// });

// authRouter.post("/tokenIsValid", async (req, res) => {
//     try {
//         const token = req.header("x-auth-token");
//         if (!token) return res.json(false);
//         const verified = jwt.verify(token, "passwordKey");
//         if (!verified) return res.json(false);

//         const user = await User.findById(verified.id);
//         if (!user) return res.json(false);
//         res.json(true);
//     } catch (e) {
//         res.status(500).json({ error: e.message });
//     }
// });

// // get user data
// authRouter.get("/", auth, async (req, res) => {
//     const user = await User.findById(req.user);
//     res.json({ ...user._doc, token: req.token });
// });

module.exports = notesRouter;
