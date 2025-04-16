const fs = require('fs');
const mysql = require('mysql2');

const db = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'Nine090649!',
    database: 'opticam'
});

db.connect(err => {
    if (err) throw err;
    console.log('MySQL Connected...');
});

// Path to the video file
const videoPath = '/Users/niner9/Downloads/car.mp4';

// Read the video file as binary data
const videoBuffer = fs.readFileSync(videoPath);

// Insert video data into the database
const query = `
    INSERT INTO videos (dashcam_serial, start_time, end_time, local_path, event_type, video_data)
    VALUES (?, ?, ?, ?, ?, ?)
`;

const videoData = [
    '0', // dashcam_serial
    '2025-04-14 10:00:00', // start_time
    '2025-04-14 10:05:00', // end_time
    '/path/to/video1.mp4', // local_path
    'normal', // event_type
    videoBuffer // video_data
];

db.query(query, videoData, (err, result) => {
    if (err) {
        console.error('Error inserting video data:', err);
    } else {
        console.log('Video data inserted successfully:', result);
    }
    db.end();
});