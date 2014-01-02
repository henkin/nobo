express = require("express")
routes = require("./routes")
user = require("./routes/user")
pi = require("./routes/pi")
http = require("http")
path = require("path")
socketio = require("socket.io")

app = express()

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", path.join(__dirname, "views")
app.set "view engine", "jade"
app.use express.favicon()
app.use express.logger("dev")
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use express.bodyParser()
app.use app.router
app.use express.static(path.join(__dirname, "public"))

# development only
app.use express.errorHandler()  if "development" is app.get("env")

server = http.createServer(app)
io = socketio.listen(server)


#routes
Pi = new pi(io)

app.get "/", routes.index
app.get "/users", user.list
app.get "/pi/index", Pi.index
app.get "/pi", Pi.index
app.get "/pi/debug", Pi.debug
app.post "/pi/set_angle", Pi.set_angle

server.listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")

