const Notes = require("../models/notes");

const validateTask = async (req, res, next) => {
    try {
        const note = await Notes.findById(req.params.noteId);
        if (!note) {
            return res.status(404).json({ msg: "Note not found" });
        }

        const task = note.tasks.find(task => task._id.toString() === req.params.taskId);
        if (!task) {
            return res.status(404).json({ msg: "Task not found" });
        }

        req.task = task;
        req.note = note;
        next();
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};


module.exports = validateTask