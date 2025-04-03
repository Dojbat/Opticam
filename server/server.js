const express = require('express'); // creats HTTP server to handles request 
const mysql = require('mysql2'); // let node.js to connect with mysql
const cors = require('cors'); // Import CORS to allow cross-origin requests

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost', // set the host as localhost
    user: 'root',
    password: 'phurich40227', // Phu's SQL password
    database: 'opticam' // 'name of the database' access the database
});

db.connect(err => { // connect the SQL to the https
    if (err) throw err;
    console.log('MySQL Connected...');
});

app.get('/users', (req, res) => {
    db.query('SELECT * FROM users', (err, result) => {
        if (err) throw err;
        res.json(result);
    });
});

app.listen(3000, () => console.log('Server started on port 3000'));

// use node server.js to run the server