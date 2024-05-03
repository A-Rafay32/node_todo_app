const mongoose = require("mongoose");
const taskSchema = require("./task");


const notesSchema = mongoose.Schema({
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    title: {
        type: String,
        required: true,
        trim: true,
        default: "Untitled Note"
    },
    description: {
        type: String,
        trim: true,
        default: ""
    },
    tasks: [taskSchema.taskSchema],

},
    { timestamps: true }
);

const Notes = mongoose.model("Notes", notesSchema);
module.exports = Notes;
