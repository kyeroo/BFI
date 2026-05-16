const prisma = require("../prisma");

const getComposter =
  async (req, res) => {

    try {

      const composter =
        await prisma.composter.findMany({
          orderBy: {
            createdAt: "desc",
          },
        });

      res.json(composter);

    } catch (error) {

      res.status(500).json({
        message: error.message,
      });
    }
};

const getTrashBins =
  async (req, res) => {

    try {

      const trashBins =
        await prisma.trashBin.findMany();

      res.json(trashBins);

    } catch (error) {

      res.status(500).json({
        message: error.message,
      });
    }
};

const pickupTrash =
  async (req, res) => {

    try {

      const { id } = req.params;

      const trashBin =
        await prisma.trashBin.update({

          where: {
            id: Number(id),
          },

          data: {
            status: "EMPTY",
          },
        });

      res.json({
        message:
          "Trash picked successfully",

        trashBin,
      });

    } catch (error) {

      res.status(500).json({
        message: error.message,
      });
    }
};

module.exports = {
  getComposter,
  getTrashBins,
  pickupTrash,
};