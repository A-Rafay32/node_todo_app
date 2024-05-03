const express = require("express");
const validateNote = require("../middlewares/note_middleware")
const { getAllNotes, createNote, updateNote, deleteNote, getNoteById } = require("../controllers/notes_controller");
const { auth } = require("../middlewares/auth_middleware");
const notesRouter = express.Router();

// Get all notes
notesRouter.get("/",
    auth,
    getAllNotes
);


// Get notes by id
notesRouter.get("/:id",
    auth,
    getNoteById,
);


//CREATE NOTES
notesRouter.post("/create",
    auth,
    createNote
);



// Update note title    
notesRouter.patch("/update/:id",
    auth,
    validateNote,
    updateNote
);


// Delete note
notesRouter.delete("/delete/:id",
    auth,
    validateNote,
    deleteNote
);


module.exports = notesRouter;
