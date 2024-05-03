const express = require("express");
const taskRouter = express.Router();
const validateTask = require("../middlewares/task_middleware");
const validateNotes = require("../middlewares/note_middleware");
const { createTask, updateTask, updateTaskStatus, deleteTask, getAllTasks } = require("../controllers/task_controller");
const { auth } = require("../middlewares/auth_middleware");

// Get all tasks for a note
taskRouter.get("/:noteId",
    auth,
    validateNotes,
    getAllTasks
);


// add task
taskRouter.patch("/create/:noteId",
    auth,
    validateNotes,
    createTask
);

// Update task
taskRouter.patch("/update/:noteId/:taskId",
    auth,
    validateTask,
    updateTask
);


// update task when done
taskRouter.patch("/done/:noteId/:taskId",
    auth,
    validateTask,
    updateTaskStatus
);

// Delete task
taskRouter.delete("/delete/:noteId/:taskId",
    auth,
    validateTask,
    deleteTask
);




module.exports = taskRouter;
