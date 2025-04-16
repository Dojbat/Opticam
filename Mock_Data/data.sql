CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dashcam_serial VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE dashcams (
    serial_number VARCHAR(50) UNIQUE NOT NULL,
    firmware_version VARCHAR(50) NOT NULL,
    status ENUM('active', 'inactive', 'deactivated') NOT NULL, -- Status ENUM
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE videos (
    video_id SERIAL PRIMARY KEY,
    dashcam_serial VARCHAR(50) NOT NULL,
    start_time VARCHAR(20) NOT NULL,
    end_time VARCHAR(20) NOT NULL,
    local_path TEXT, -- Local file path on dashcam
    event_type ENUM('normal', 'drowsy') NOT NULL, -- Event type ENUM
    video_data LONGBLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_stats (
    dashcam_serial VARCHAR(50) NOT NULL,
    drowsy INT,
    yawing INT,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);