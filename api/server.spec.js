const request = require('supertest');
const { app, server } = require('./server');

afterAll(() => {
  server.close();
});

it('GET "/"', async () => {
  const response = await request(app).get('/');
  expect(response.statusCode).toEqual(200);
});
