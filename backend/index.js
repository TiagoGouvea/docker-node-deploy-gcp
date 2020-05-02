var http = require('http');
var handleRequest = function(request, response) {
  response.writeHead(200);
  response.end("I'm alive");
}
var www = http.createServer(handleRequest);
var port = process.env.PORT || 8080;
www.listen(port, function () {
  console.log("Node server listening at port "+port);
});
