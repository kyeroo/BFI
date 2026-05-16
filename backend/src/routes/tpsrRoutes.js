const express = require("express");

const router = express.Router();

const authMiddleware =
  require("../middleware/authMiddleware");

const roleMiddleware =
  require("../middleware/roleMiddleware");

const {
  getComposter,
  getTrashBins,
  pickupTrash,
} = require("../controllers/tpsrController");

router.use(
  authMiddleware,
  roleMiddleware("TPSR")
);

router.get(
  "/composter",
  getComposter
);

router.get(
  "/trash-bins",
  getTrashBins
);

router.patch(
  "/trash-bins/:id/pickup",
  pickupTrash
);

module.exports = router;