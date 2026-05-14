const express = require("express");
const router = express.Router();

const authMiddleware = require("../middleware/authMiddleware");
const roleMiddleware = require("../middleware/roleMiddleware");

router.get(
  "/tps",
  authMiddleware,
  roleMiddleware("tps"),
  (req, res) => {

    res.json({
      message: "Welcome TPS",
      user: req.user
    });
  }
);

router.get(
  "/horeca",
  authMiddleware,
  roleMiddleware("horeca"),
  (req, res) => {

    res.json({
      message: "Welcome Horeca",
      user: req.user
    });
  }
);

router.get(
  "/petani",
  authMiddleware,
  roleMiddleware("petani"),
  (req, res) => {

    res.json({
      message: "Welcome Petani",
      user: req.user
    });
  }
);

module.exports = router;