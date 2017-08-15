var jsonServer = require("json-server");
var path = require("path");

// Returns an Express server

var server = jsonServer.create();

// Set default middlewares (logger, static, cors and no-cache)

server.use(jsonServer.defaults());

var router = jsonServer.router(path.join(__dirname, "db.json"));
server.use(router);

server.use(jsonServer.rewriter({
  '/users/:id': '/users/:handle'
}))

router.render = (req, res) => {
  var data;

  data = req.query.hasOwnProperty("handle")
    ? res.locals.data[0]
    : res.locals.data;

  res.jsonp(data);
}

console.log("JSON Server: Listening on port 5000");
server.listen(5000);
