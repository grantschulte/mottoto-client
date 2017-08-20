const jsonServer = require("json-server");
const path = require("path");

let server = jsonServer.create();
let router = jsonServer.router(path.join(__dirname, "data.json"));

server.use(jsonServer.defaults());
server.use(router);
server.listen(5000);

console.log("JSON Server: Listening on port 5000");
