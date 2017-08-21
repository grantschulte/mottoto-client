const jsonServer = require("json-server");
const path = require("path");
const server = jsonServer.create();
const router = jsonServer.router(path.join(__dirname, "data.json"));
const middlewares = jsonServer.defaults();
const port = 5000;

server.use(middlewares);
server.use(checkIfAuthorized);
server.use(router);
server.listen(port, () => {
  console.log("JSON Server is running on port ", port);
});

function checkIfAuthorized(req, res, next) {
  if (isAuthorized(req)) {
    next();
  } else {
    res.status(401).send("Unauthorized");
  }
}

function isAuthorized(req) {
  console.log("TOKEN", req.headers.authorization);
  return true;
}
