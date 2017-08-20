const jsonServer = require("json-server");
const path = require("path");
const server = jsonServer.create();
const router = jsonServer.router(path.join(__dirname, "data.json"));
const middleware = jsonServer.defaults();
const port = 5000;

server.use(middleware);
server.use(router);

server.listen(port, () => {
  console.log("JSON Server is running on port ", port);
});
