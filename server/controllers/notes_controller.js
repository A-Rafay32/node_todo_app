const Notes = require("../models/notes");

module.exports = {
    getAllNotes: async (req, res) => {
        try {
            const tasks = await Notes.find();
            res.json(tasks);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    getNoteById: async (req, res) => {
        try {
            const noteId = req.params.id;
            if (!noteId) {
                return res.status(400).json({
                    code: 400,
                    message: "id is required",
                });
            }

            const foundNote = Notes.findById(noteId);
            if (!foundNote) {
                return res.status(400).json({
                    code: 400,
                    message: "Note does not found",
                });
            }

            res.status(200).json({
                code: 200,
                message: "Note found successfully",
                data: foundNote
            })
        } catch (error) {
            res.status(500).json({
                code: 500,
                error: error.name,
                message: error.message,
            });
        }

    },

    createNote: async (req, res) => {
        try {
            const { userId, title, description, tasks } = req.body;

            const newNote = new Notes({
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
            const note = await Notes.findByIdAndDelete(req.params.id);
            res.status(200).json({
                code: 200,
                message: "Note deleted successfully",
                data: note
            });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}

