const express = require("express");
const authRouter = express.Router();
const { auth, isValidToken } = require("../middlewares/auth_middleware");
const { signUp, getUser, signIn } = require("../controllers/auth_controller");

// SIGN UP
authRouter.post("/sign-up", signUp);

// Sign In Route
authRouter.post("/sign-in", signIn);

authRouter.post("/tokenIsValid", isValidToken);

// get user data
authRouter.get("/", auth, getUser);

module.exports = authRouter;
