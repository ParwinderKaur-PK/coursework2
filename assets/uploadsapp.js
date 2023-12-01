var express=require("express");
var session=require("express-session");
var fileUpload = require('express-fileupload');
//var multer = require('multer');
var app=express();

const mysql=require("mysql");

const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "coursework2"
  });

  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
    var sql = "CREATE TABLE IF NOT EXISTS User (id int primary key auto_increment, name VARCHAR(50), email VARCHAR(150), contact VARCHAR(10), password VARCHAR(10))";
    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("Table created");
    });
    var sql = "CREATE TABLE IF NOT EXISTS VideoFile (id int primary key auto_increment, name VARCHAR(50), path TEXT)";
    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("Table created");
    });
  });

  // Define multer storage
  //var storage = multer.diskStorage({
    //destination: function(req, file, callback) {
      // Specify the destination folder
      //callback(null, 'assets/uploads');
    //},
    //filename: function(req, file, callback) {
      // Specify the file name
      //callback(null, file.fieldname + '-' + Date.now());
      //callback(null, file.fieldname + '.'+file.mimetype);
    //}
//});

app.use(express.json());       
app.use(express.urlencoded({extended: true})); 

app.use(express.static('assets'))
app.use("/css",express.static(__dirname+"assets/css"))
app.use("/images",express.static(__dirname+"assets/images"))
app.use("/js",express.static(__dirname+"assets/js"))
app.use("/jquery",express.static(__dirname+"assets/jquery"))
app.use("/bootstrap",express.static(__dirname+"assets/bootstrap"))
app.use(session({
    secret:'weblession',
    resave:true,
    saveUninitialized:true
}));

//Set views
app.set("views","./views")
app.set("view engine","ejs")

/*var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: ""
  });
  
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
    con.query("CREATE DATABASE coursework2", function (err, result) {
      if (err) throw err;
      console.log("Database created");
    });
  });*/



app.get('/',function(req,res){
    //res.sendFile(__dirname+'/views/index.html',{text:"hello"});
    res.render("index",{session:req.session});
});

app.get('/login',function(req,res){
    res.render("login")
});

app.get('/registration',function(req,res){
    res.render("registration")
});

app.get('/logout',function(req,res){
    req.session.destroy();
    res.render("/");
});

app.get('/videoUpload',function(req,res){
    res.render("videoUpload");
});

app.post('/registration',function(req,res,next){
    var name=req.body.username;
    var email=req.body.email;
    var contact=req.body.contact;
    var password=req.body.password;
    var sql = `INSERT INTO User (name, email, contact, password) VALUES ("${name}","${email}","${contact}","${password}")`;
    con.query(sql, function (err, result) {
        if (err) throw err;
        console.log("1 record inserted");
    });
    res.redirect("/login")
});

app.post('/login',function(req,res,next){
    var email=req.body.email;
    var password=req.body.password;
    var sql = `SELECT * FROM User where email="${email}" AND password="${password}"`;
    con.query(sql, function (err, result) {
        if (err) throw err;
        if(result.length>0){
            req.session.user_id=result[0].name;
            res.redirect("/");
        }
        else
            res.redirect("/login");
    });
});

// Enable files upload
app.use(fileUpload({
  createParentPath: true
}));

// Upload endpoint
app.post('/videoUpload', async (req, res) => {
  try {
      if(!req.files) {
          res.send({
              status: false,
              message: 'No file uploaded'
          });
      } else {
          // Use the name of the input field (i.e. "filetoupload") to retrieve the uploaded file
          let filetoupload = req.files.filetoupload;

          // Use the mv() method to place the file in upload directory (i.e. "uploads")
          filetoupload.mv('assets/uploads' + filetoupload.name);
          // Insert the file name and path into mysql table
          var sql = 'INSERT INTO VideoFile (name, path) VALUES (?, ?)';
          var values = [fileName, filePath];
          con.query(sql, values, function(err, result) {
            if (err) throw err;
            console.log('File name and path inserted into mysql');
          });
          // Send response
          res.send({
              status: true,
              message: 'File is uploaded',
              data: {
                  name: filetoupload.name,
                  mimetype: filetoupload.mimetype,
                  size: filetoupload.size
              }
          });
      }
  } catch (err) {
      res.status(500).send(err);
  }
});

// Create multer instance
//var upload = multer({ storage: storage });

// Define upload route
//app.post('/videoUpload', upload.single('file'), function(req, res) {
  // Get the file name and path
  //var fileName = req.file.filename;
  //var filePath = req.file.path;

  // Insert the file name and path into mysql table
  //var sql = 'INSERT INTO VideoFile (name, path) VALUES (?, ?)';
  //var values = [fileName, filePath];
  //con.query(sql, values, function(err, result) {
    //if (err) throw err;
    //console.log('File name and path inserted into mysql');
  //});

  // Send a response to the client
  //res.send('Video uploaded successfully');
//});

// Server setup 
app.listen(3000, () => { 
    console.log("Server is Running") 
}) 
