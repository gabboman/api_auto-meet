var express = require('express');

var app = express();

var mysql      = require('mysql');

var connection = mysql.createConnection({//debo externalizar esto a un archivo, capischi?
  host     : 'localhost',
  user     : 'cm',
  password : 'cm',
  database : 'cm'
});

connection.connect();



app.get('/wines', function(req, res) {
    res.send([{name:'wine1'}, {name:'wine2'}]);
});
app.get('/wines/:id', function(req, res) {
    res.send({id:req.params.id, name: "The Name", description: "description"});
});

app.listen(3000);
console.log('Listening on port 3000...');
