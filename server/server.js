const express = require('express'); // creats HTTP server to handles request 
const mysql = require('mysql2'); // let node.js to connect with mysql
const cors = require('cors'); // Import CORS to allow cross-origin requests
const bcrypt = require('bcrypt');
const app = express();
app.use(cors());
app.use(express.json());
// curl http://localhost:3000/users
const db = mysql.createConnection({
    host: '127.0.0.1', // set the host as localhost
    user: 'root',
    password: '', // Phu's SQL password
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

app.post('/signup', async (req, res) => {
    const { username, email, password } = req.body;

    console.log('Signup request received:', { username, password });

    if (!username || !email || !password) {
        return res.status(400).json({ message: 'All fields are required' });
    }

    try {
        // Hash the password
        const saltRounds = 10;
        const password_hash = await bcrypt.hash(password, saltRounds);

        // Insert the new user into the database
        const query = 'INSERT INTO users (username, email, password_hash, dashcam_serial) VALUES (?, ?, ?, ?)';
        const dashcam_serial = '0'; // default daashcam number (indicate the dashcam is not connected yet)
        db.query(query, [username, email, password_hash, dashcam_serial], (err, result) => {
            if (err) {
                console.error('Database query error:', err);
                return res.status(500).json({ message: 'Server error', error: err.message });
            }

            console.log('User created successfully:', result);
            res.status(201).json({ success: true, message: 'User created successfully' });
        });
    } catch (err) {
        console.error('Error hashing password:', err);
        res.status(500).json({ message: 'Server error', error: err.message });
    }
});

app.post('/login', (req, res) => { 
    const { username, password } = req.body;

    if (!username || !password) { // if the username and password are empty
        console.log('Login request received:', { username, password });
        return res.status(400).json({ message: 'Username and password are required' });
    }

    const query = 'SELECT * FROM users WHERE username = ?'; // query to check if the username are in the database
    console.log('Executing query:', query, [username, password]); 
    db.query(query, [username, password], async (err, result) => { 
        if (err) {
            console.error('Database query error:', err);
            return res.status(500).json({ message: 'Server error' });
        }

        if (result.length === 0) {
            return res.status(401).json({ success: false, message: 'Invalid username' });
        }

        const user = result[0]; 

        try {
            // Compare the provided password with the hashed password in the database
            const isMatch = await bcrypt.compare(password, user.password_hash);

            if (isMatch) {
                console.log('Login successful:', user);
                res.json({ success: true, message: 'Login successful', user });
            } else {
                res.status(401).json({ success: false, message: 'Invalid password' }); // 401 - Unauthorized
            }
        } catch (err) {
            console.error('Error comparing passwords:', err);
            res.status(500).json({ message: 'Server error' });
        }
    });
});

// Endpoint to retrieve collision videos for a specific user
app.get('/collision-videos/:userId', (req, res) => {
    const userId = req.params.userId;

    // Query to get the user's dashcam_serial
    const userQuery = 'SELECT dashcam_serial FROM users WHERE id = ?';

    db.query(userQuery, [userId], (err, userResult) => {
        if (err) {
            console.error('Error retrieving user dashcam_serial:', err);
            return res.status(500).json({ message: 'Failed to retrieve user data' });
        }

        if (userResult.length === 0) {
            return res.status(404).json({ message: 'User not found' });
        }

        const dashcamSerial = userResult[0].dashcam_serial;
        console.log('Dashcam Serial:', dashcamSerial);

        // Query to get collision videos for the user's dashcam
        const videoQuery = `
            SELECT video_id, dashcam_serial, local_path, event_type, start_time, end_time, video_data, created_at
            FROM videos
            WHERE event_type = 'drowsy' AND dashcam_serial = ?
            ORDER BY created_at DESC
        `;

        db.query(videoQuery, [dashcamSerial], (err, videoResults) => {
            if (err) {
                console.error('Error retrieving collision videos:', err);
                return res.status(500).json({ message: 'Failed to retrieve drowsy videos' });
            }

            if (videoResults.length > 0) {
                // Encode video_data as base64
                const videos = videoResults.map(video => ({
                    video_id: video.video_id,
                    dashcam_serial: video.dashcam_serial,
                    local_path: video.local_path,
                    event_type: video.event_type,
                    start_time: video.start_time,
                    end_time: video.end_time,
                    created_at: video.created_at,
                    video_data: video.video_data ? video.video_data.toString('base64') : null // Encode binary data
                }));

                console.log('Collision videos retrieved for user:', videos);
                res.json({ success: true, videos });
            } else {
                res.json({ success: false, message: 'No drowsy videos found for this user' });
            }
        });
    });
});


app.listen(3000, () => console.log('Server started on port 3000'));

// use node server.js to run the server