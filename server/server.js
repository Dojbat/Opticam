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

app.post('/login', (req, res) => { 
    const { username, password } = req.body;

    console.log('Login request received:', { username, password }); // display the login request

    if (!username || !password) { // if the username and password are empty
        console.log('Login request received:', { username, password });
        return res.status(400).json({ message: 'Username and password are required' });
    }

    const query = 'SELECT * FROM users WHERE username = ? AND password_hash = ?'; // query to check if the username and password are in the database
    console.log('Executing query:', query, [username, password]); 
    db.query(query, [username, password], (err, result) => { 
        if (err) {
            console.error('Database query error:', err);
            return res.status(500).json({ message: 'Server error' });
        }

        console.log('Query result:', result);

        if (result.length > 0) { 
            console.log('Login successful:', result[0]);
            res.json({ success: true, message: 'Login successful', user: result[0] });
        } else {
            console.log('Invalid username or password');
            res.status(401).json({ success: false, message: 'Invalid username or password' });
        }
    });
});

app.listen(3000, () => console.log('Server started on port 3000'));

// use node server.js to run the server