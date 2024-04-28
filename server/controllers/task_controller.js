const Task = require("../models/task");

module.exports = {
    getAllTasks: async (req, res) => {
        try {
            const note = req.note;
            const tasks = note.tasks;
            res.json({ tasks });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    createTask: async (req, res) => {
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
    },

    updateTask: async (req, res) => {
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
    },

    updateTaskStatus: async (req, res) => {
        try {
            const task = req.task;
            task.status = true;

            await task.save();
            res.json(task);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }

    },

    deleteTask: async (req, res) => {
        try {

            const note = req.note;
            note.tasks.pull({ _id: req.params.taskId });

            await note.save();
            res.json({ msg: "Task deleted successfully" });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
}
