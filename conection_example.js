require('./conection.js')
var mysql= require('mysql');

var connection = mysql.createConnection({//debo externalizar esto a un archivo, capischi?
  host     : 'localhost',
  user     : 'cm',
  password : 'cm',
  database : 'cm'
});

connection.connect();
