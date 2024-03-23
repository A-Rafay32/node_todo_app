const Notes = require("../models/notes");

const validateNotes = async (req, res, next) => {
    try {
        const note = await Notes.findById(req.params.noteId);
        if (!note) {
            return res.status(404).json({ msg: "Note not found" });
        }
        req.note = note;
        next();
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

module.exports = validateNotes; 
