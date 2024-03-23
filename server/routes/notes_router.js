const express = require("express");
const Note = require("../models/notes");
const auth = require("../middlewares/auth_middleware");
const validateNotes = require("../middlewares/note_middleware")
const validateTask = require("../middlewares/task_middleware")
const notesRouter = express.Router();

//CREATE NOTES
notesRouter.post("/api/create/notes", auth, async (req, res) => {
    try {
        const { userId, title, description, tasks } = req.body;

        const newNote = new Note({
            userId: userId,
            title: title,
            description: description,
            task: tasks,
        });

        const savedNote = await newNote.save();
        res.status(201).json(savedNote);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});



// Update note title
notesRouter.put("/api/update/note/:noteId", auth, validateNotes, async (req, res) => {
    try {
        const { title, description } = req.body;
        const note = req.note;

        note.title = title;
        note.description = description;


        await note.save();
        res.json(note);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});


// Delete note
notesRouter.delete("/api/delete/note/:noteId", auth, validateNotes, async (req, res) => {
    try {
        const note = req.note;
        await note.deleteOne();
        res.json({ msg: "Note deleted successfully" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Get all note for a user
notesRouter.get("/api/notes/:userId", auth, async (req, res) => {
    try {
        const note = await Note.find({ userId: req.params.userId });
        res.json(note);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});


// Get all notes
notesRouter.get("/api/notes/", auth, async (req, res) => {
    try {
        const tasks = await Note.find();
        res.json(tasks);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = notesRouter;
