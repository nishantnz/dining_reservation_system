const jwt = require("jsonwebtoken");

const app = require("express");

const PORT = process.env.PORT;

app.post("api/login", (req, res) => {
  let jwtSecretKey = process.env.JWT_SECRET_KEY;
  let data = {
    time: Date(),
    userId: 12,
  };

  const token = jwt.sign(data, jwtSecretKey);

  res.send(token);
});
