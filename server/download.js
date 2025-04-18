const fs = require('fs');
const mysql = require('mysql2');

// Create a connection to the database
const db = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'opticam'
});

// Connect to the database
db.connect(err => {
    if (err) {
        console.error('Database connection failed:', err.message);
        process.exit(1);
    }
    console.log('MySQL Connected...');
});

// Video ID to download
const videoId = 1; // Replace with the ID of the video you want to download

// Query to retrieve the video data
const query = `
    SELECT video_data, local_path
    FROM videos
    WHERE video_id = ?
`;

db.query(query, [videoId], (err, result) => {
    if (err) {
        console.error('Error retrieving video data:', err);
        db.end();
        return;
    }

    if (result.length === 0) {
        console.error('Video not found');
        db.end();
        return;
    }

    const video = result[0];

    if (!video.video_data) {
        console.error('Video data is empty');
        db.end();
        return;
    }

    // Save the video to a file
    const fileName = video.local_path.split('/').pop(); // Extract the file name from the local_path
    fs.writeFileSync(fileName, video.video_data);
    console.log(`Video downloaded successfully as ${fileName}`);

    // Close the database connection
    db.end();
});