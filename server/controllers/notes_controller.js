const Note = require("../models/notes");

module.exports = {
    getAllNotes: async (req, res) => {
        try {
            const tasks = await Note.find();
            res.json(tasks);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    createNote: async (req, res) => {
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
    },

    updateNote: async (req, res) => {
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
    },
    deleteNote: async (req, res) => {
        try {
            const note = await Note.find({ userId: req.params.userId });
            res.json(note);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}

