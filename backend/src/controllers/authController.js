const prisma = require("../prisma");

const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const register = async (req, res) => {
  try {

    const {
      name,
      email,
      password,
      role,
    } = req.body;

    const userExist =
      await prisma.user.findUnique({
        where: { email },
      });

    if (userExist) {
      return res.status(400).json({
        message: "Email already used",
      });
    }

    const hashedPassword =
      await bcrypt.hash(password, 10);

    const user =
      await prisma.user.create({
        data: {
          name,
          email,
          password: hashedPassword,
          role,
        },
      });

    res.status(201).json({
      message: "Register success",
      user,
    });

  } catch (error) {

    res.status(500).json({
      message: error.message,
    });
  }
};

const login = async (req, res) => {
  try {

    const {
      email,
      password,
    } = req.body;

    const user =
      await prisma.user.findUnique({
        where: { email },
      });

    if (!user) {
      return res.status(404).json({
        message: "User not found",
      });
    }

    const isPasswordValid =
      await bcrypt.compare(
        password,
        user.password
      );

    if (!isPasswordValid) {
      return res.status(400).json({
        message: "Wrong password",
      });
    }

    const token = jwt.sign(
      {
        id: user.id,
        role: user.role,
      },

      "SECRET_KEY",

      {
        expiresIn: "7d",
      }
    );

    res.json({
      message: "Login success",

      token,

      user: {
        id: user.id,
        name: user.name,
        email: user.email,
        role: user.role,
      },
    });

  } catch (error) {

    res.status(500).json({
      message: error.message,
    });
  }
};

module.exports = {
  register,
  login,
};