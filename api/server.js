const express = require('express');

const app = express();

const PORT = 8080;

app.get('/', (req, res) => {
  res.json({
    message: 'Welcome to the Header Parser Microservice'
  });
});

app.get('/whoami', function (req, res) {
  const userDetails = {
    ipaddress: req.header('x-forwarded-for') || req.connection.remoteAddress || req.socket.remoteAddress,
    language: req.headers['accept-language'].slice(0, req.headers['accept-language'].indexOf(',')),
    software: req.headers['user-agent'],
  }
  res.json(userDetails);
});

app.listen(PORT, console.log('Server started listening on port: ', PORT));