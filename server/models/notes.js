// notes.js
const mongoose = require("mongoose");

const notesSchema = new mongoose.Schema({
  title: {
    required: true,
    type: String,
    trim: true,
  },
  description: {
    required: true,
    type: String,
  },
  priority: {
    required: true,
    type: Number,
  },
  status: {
    required: true,
    type: Boolean,
  }
});

module.exports = notesSchema;