const express = require("express");
const cors = require("cors");
const prisma = require("./lib/prisma");

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.json({
    message: "Backend EchoCycle is running"
  });
});

app.post("/user", async (req, res) => {
  try {
    const user = await prisma.user.create({
      data: {
        name: "Rizky",
        email: "rizky@gmail.com",
        password: "123456",
        role: "tps"
      }
    });

    res.json(user);

  } catch (error) {
    console.log(error);
    res.status(500).json({
      message: "Error"
    });
  }
});

const authRoutes = require("./routes/authRoutes");
app.use("/auth", authRoutes);

const dashboardRoutes = require("./routes/dashboardRoutes");
app.use("/dashboard", dashboardRoutes);

const PORT = 3000;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});