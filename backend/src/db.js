const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'doctor_database'
});

connection.connect(function(err) {
    if (err) {
        console.log(err);
        return;
    } else {
        console.log('Data base is connected');
    }
});

module.exports = connection;