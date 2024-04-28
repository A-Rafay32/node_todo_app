const express = require("express");
const validateNote = require("../middlewares/note_middleware")
const { getAllNotes, createNote, updateNote, deleteNote } = require("../controllers/notes_controller");
const notesRouter = express.Router();

// Get all notes
notesRouter.get("/", auth, getAllNotes);


//CREATE NOTES
notesRouter.post("/create", auth, createNote);



// Update note title
notesRouter.put("/update/:noteId", auth, validateNote, updateNote);


// Delete note
notesRouter.delete("/delete/:noteId", auth, validateNote, deleteNote);




module.exports = notesRouter;
