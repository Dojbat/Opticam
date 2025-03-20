from flask import Flask, request, jsonify
import mysql.connector

app = Flask(__name__)

# Database connection
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="12345678",  # Replace with your actual MySQL password
    database="opticam"
)

cursor = db.cursor(dictionary=True)

# ✅ Endpoint: Get all users
@app.route('/users', methods=['GET'])
def get_users():
    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()
    return jsonify(users)

# ✅ Endpoint: Get stats for a user
@app.route('/stats/<string:dashcam_serial>', methods=['GET'])
def get_user_stats(dashcam_serial):
    cursor.execute("SELECT * FROM user_stats WHERE dashcam_serial = %s", (dashcam_serial,))
    stats = cursor.fetchall()
    return jsonify(stats)

# ✅ Endpoint: Get video records for a dashcam
@app.route('/videos/<string:dashcam_serial>', methods=['GET'])
def get_video_records(dashcam_serial):
    cursor.execute("SELECT * FROM videos WHERE dashcam_serial = %s", (dashcam_serial,))
    videos = cursor.fetchall()
    return jsonify(videos)

# ✅ Endpoint: Insert a new drowsiness event
@app.route('/drowsiness', methods=['POST'])
def insert_drowsiness_event():
    data = request.json
    sql = """
        INSERT INTO user_stats (dashcam_serial, drowsy, yawing, start_time, end_time)
        VALUES (%s, %s, %s, %s, %s)
    """
    values = (
        data['dashcam_serial'],
        data['drowsy'],
        data['yawing'],
        data['start_time'],
        data['end_time']
    )
    cursor.execute(sql, values)
    db.commit()
    return jsonify({"message": "Drowsiness event added"}), 201

# ✅ Endpoint: Get dashcam details
@app.route('/dashcams/<string:serial_number>', methods=['GET'])
def get_dashcam_details(serial_number):
    cursor.execute("SELECT * FROM dashcams WHERE serial_number = %s", (serial_number,))
    dashcam = cursor.fetchone()
    return jsonify(dashcam)

# ✅ Run the API
if __name__ == '__main__':
    app.run(debug=True)