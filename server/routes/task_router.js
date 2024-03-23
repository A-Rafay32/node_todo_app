const express = require("express");
const { Task } = require("../models/task");
const Note = require("../models/notes");
const taskRouter = express.Router();
const auth = require("../middlewares/auth_middleware");
const validateTask = require("../middlewares/task_middleware");
const validateNotes = require("../middlewares/note_middleware");


// add task
taskRouter.put("/api/create/task/:noteId", auth, validateNotes, async (req, res) => {
    try {
        const note = req.note;
        const { title, priority, category, status } = req.body;

        const existingTask = await Task.findOne({ title });
        if (existingTask) {
            return res.status(400).json({ msg: "Task with the same title already exists!" });
        }

        const task = new Task({
            title: title,
            priority: priority,
            category: category,
            status: status
        });

        note.tasks.push(task);
        const updatedNote = await note.save();
        res.json(updatedNote);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Update task
taskRouter.put("/api/update/task/:noteId/:taskId", auth, validateTask, async (req, res) => {
    try {
        const { title, description, priority, status, category } = req.body;
        const task = req.task;

        task.title = title;
        task.description = description;
        task.priority = priority;
        task.status = status;
        task.category = category;

        await task.save();
        res.json(task);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});


// update task when done
taskRouter.put("/api/task/done/:noteId/:taskId", auth, validateTask, async (req, res) => {
    try {
        const task = req.task;
        task.status = true;

        await task.save();
        res.json(task);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }

});

// Delete task
taskRouter.delete("/api/delete/task/:noteId/:taskId", auth, validateTask, async (req, res) => {
    try {
        
        const note = req.note;
        note.tasks.pull({ _id: req.params.taskId });

        await note.save();
        res.json({ msg: "Task deleted successfully" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Get all tasks for a note
taskRouter.get("/api/tasks/:noteId", auth, validateNotes, async (req, res) => {
    try {
        const note = req.note;
        const tasks = note.tasks;
        res.json({ tasks });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});




module.exports = taskRouter;
