const jwt = require("jsonwebtoken");
const User = require("../models/user")

const auth = async (req, res, next) => {
    try {
        const token = req.header("Authorization");
        if (!token)
            return res.status(401).json({ msg: "No auth token, access denied" });

        const verified = jwt.verify(token, "passwordKey");
        if (!verified)
            return res
                .status(401)
                .json({ msg: "Token verification failed, authorization denied." });

        req.user = verified.id;
        req.token = token;
        next();
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

const isValidToken = async (req, res) => {
    try {
        const token = req.header("x-auth-token");
        if (!token) return res.json(false);
        const verified = jwt.verify(token, "passwordKey");
        if (!verified) return res.json(false);

        const user = await User.findById(verified.id);
        if (!user) return res.json(false);
        res.json(true);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
}

module.exports = { auth, isValidToken };
