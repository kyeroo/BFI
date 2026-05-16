const express = require("express");
const cors = require("cors");
const authRoutes = require("./routes/authRoutes");
const tpsrRoutes = require("./routes/tpsrRoutes");

const app = express();

app.use(cors());
app.use(express.json());


app.use("/auth", authRoutes);

app.use("/tpsr", tpsrRoutes);


app.get("/", (req, res) => {
  res.json({
    message: "EchoCycle API Running",
  });
});


module.exports = app;