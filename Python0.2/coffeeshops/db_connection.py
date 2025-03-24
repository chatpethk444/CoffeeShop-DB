import mysql.connector

# ฟังก์ชันเชื่อมต่อ MySQL
def connect_db():
    return mysql.connector.connect(
        host="127.0.0.1",
        user="root",
        password="1234",  # ใส่รหัสผ่าน MySQL ของคุณ
        database="coffeeshops"  # ชื่อฐานข้อมูล
    )