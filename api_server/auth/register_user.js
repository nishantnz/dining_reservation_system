const jwt = require("jsonwebtoken");
const { PrismaClient } = require("@prisma/client");
const express = require("express");
const { log } = require("console");
const prisma = new PrismaClient();

const app = express();
app.use(express.json());

const PORT = 3000;
app.post("/api/register", async (req, res) => {
  const { name, email, password } = req.body;
  const newUser = await prisma.user.create({
    data: {
      email: email,
      name: name,
      password: password,
    },
  });
  // .then(async () => {
  //   await prisma.$disconnect();
  // })
  // .catch(async (e) => {
  //   console.error(e);
  //   await prisma.$disconnect();
  //   process.exit(1);
  // });

  res.status(200).json({
    newUser,
  });
});

app.listen(PORT, (error) => {
  if (!error) console.log("Server is Successfully Running, " + PORT);
  else console.log("Error occurred, server can't start", error);
});
