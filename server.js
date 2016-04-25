var express = require('express');

var app = express();

var mysql      = require('mysql');

var connection = mysql.createConnection({//debo externalizar esto a un archivo, capischi?
  host     : 'localhost',
  user     : 'cm',
  password : 'cm',
  database : 'cm'
});


connection.connect(function(err){
if(!err) {
    console.log("Database is connected ... nn");
} else {
    console.log("Error connecting database ... nn");
}
});

//var pueblos=dict();

connection.query('SELECT * from pueblos', function(err, rows, fields){
  res.send(rows)
  //for(var a in rows){
  //  console.log(a['nombre_pueblo']);
  //}
})


app.get("/",function(req,res){
connection.query('SELECT * from pueblos', function(err, rows, fields) {
connection.end();
  if (!err)
    console.log('The solution is: ', rows);
  else
    console.log('Error while performing Query.');
  });
});


app.get('/wines', function(req, res) {
    res.send([{name:'wine1'}, {name:'wine2'}]);
});
app.get('/wines/:id', function(req, res) {
    res.send({id:req.params.id, name: "The Name", description: "description"});
});


app.listen(3000);
console.log('Listening on port 3000...');
