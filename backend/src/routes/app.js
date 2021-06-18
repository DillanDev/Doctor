const express = require('express');
const router = express.Router();

const connection = require('../db');

router.get('/', (req, res) => {

    connection.query("SELECT * FROM people", (err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });

});

router.get('/:id', (req, res) => {
    const { id } = req.params;
    connection.query("SELECT * FROM people WHERE id = ?", [id], (err, rows, fields) => {
        if (!err) {
            res.json(rows[0]);
        } else {
            console.log(err);
        }
    });
    //console.log(id);
});

module.exports = router;