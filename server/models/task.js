const mongoose = require("mongoose");
const category = require("./category");

const taskSchema = mongoose.Schema({
  title: {
    type: String,
    required: true,
    trim: true,
    maxlength: 100
  },
  priority: {
    type: Number,
    min: 1,
    max: 5,
    default: 1,
  },
  status: {
    type: Boolean,
    default: false
  },
  category: {
    type: String,
    enum: category,
    default: category.at(category.length - 1)
  }
});

const Task = mongoose.model("Task", taskSchema);
module.exports = { Task, taskSchema };
