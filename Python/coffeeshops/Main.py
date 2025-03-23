import mysql.connector
from tkinter import *
from tkinter import messagebox, ttk
from tkinter.ttk import Combobox
from db_connection import connect_db

# ฟังก์ชันดึงข้อมูลทั้งหมดจากตาราง
def fetch_data(table_name):
    conn = connect_db()
    cursor = conn.cursor()
    
    # ถ้าเป็นตาราง Employee ให้คำนวณอายุจากคอลัมน์ E_Birth
    if table_name == "Employee":
        cursor.execute("""
    SELECT EmployeeID, E_Name, E_Brith, TIMESTAMPDIFF(YEAR, E_Brith, CURDATE()) AS E_Age ,
    E_Salary, E_Position, E_ManagerID,DepartmentID
    FROM Employee
    """)
    else:
        cursor.execute(f"SELECT * FROM {table_name}")
    
    rows = cursor.fetchall()
    conn.close()
    return rows

# ฟังก์ชันดึงชื่อคอลัมน์ของตาราง
def get_columns(table_name):
    conn = connect_db()
    cursor = conn.cursor()
    
    # ถ้าเป็นตาราง Employee ให้เพิ่มคอลัมน์ E_age ในผลลัพธ์
    if table_name == "Employee":
        cursor.execute("SHOW COLUMNS FROM Employee")
        columns = [row[0] for row in cursor.fetchall()]
    else:
        cursor.execute(f"SHOW COLUMNS FROM {table_name}")
        columns = [row[0] for row in cursor.fetchall()]
    
    conn.close()
    return columns

# ฟังก์ชันแสดงข้อมูลใน Treeview
def show_data():
    table_name = combo_table.get()
    columns = get_columns(table_name)
    
    # ล้างข้อมูลเดิมใน Treeview
    for row in tree.get_children():
        tree.delete(row)
    
    # ตั้งค่า Treeview ให้แสดงชื่อคอลัมน์
    tree["columns"] = columns
    for col in columns:
        tree.heading(col, text=col)
        tree.column(col, width=100)
    
    # แสดงข้อมูลใน Treeview
    for row in fetch_data(table_name):
        tree.insert("", END, values=row)

# ฟังก์ชันเพิ่มข้อมูล
def insert_data():
    table_name = combo_table.get()
    columns = get_columns(table_name)
    
    # ไม่รวมคอลัมน์ E_age ในการเพิ่มข้อมูล
    if table_name == "Employee":
        columns = [col for col in columns if col != "E_Age"]
    
    values = [entry_list[i].get() for i in range(len(columns))]
    
    conn = connect_db()
    cursor = conn.cursor()
    sql = f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES ({', '.join(['%s'] * len(columns))})"
    try:
        cursor.execute(sql, values)
        conn.commit()
        messagebox.showinfo("Success", "Data inserted successfully")
        show_data()
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error: {err}")
    finally:
        conn.close()

# ฟังก์ชันอัปเดตข้อมูล
def update_data():
    table_name = combo_table.get()
    columns = get_columns(table_name)
    
    # ไม่รวมคอลัมน์ E_age ในการอัปเดตข้อมูล
    if table_name == "Employee":
        columns = [col for col in columns if col != "E_Age"]
    
    values = [entry_list[i].get() for i in range(len(columns))]
    primary_key = columns[0]  # สมมติว่าคอลัมน์แรกเป็น Primary Key
    
    conn = connect_db()
    cursor = conn.cursor()
    sql = f"UPDATE {table_name} SET {', '.join([f'{col}=%s' for col in columns[1:]])} WHERE {primary_key}=%s"
    try:
        cursor.execute(sql, values[1:] + [values[0]])
        conn.commit()
        messagebox.showinfo("Success", "Data updated successfully")
        show_data()
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error: {err}")
    finally:
        conn.close()

# ฟังก์ชันลบข้อมูล
def delete_data():
    table_name = combo_table.get()
    primary_key = get_columns(table_name)[0]  # สมมติว่าคอลัมน์แรกเป็น Primary Key
    value = entry_list[0].get()
    
    conn = connect_db()
    cursor = conn.cursor()
    sql = f"DELETE FROM {table_name} WHERE {primary_key}=%s"
    try:
        cursor.execute(sql, (value,))
        conn.commit()
        messagebox.showinfo("Success", "Data deleted successfully")
        show_data()
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error: {err}")
    finally:
        conn.close()

# ฟังก์ชันสร้าง Entry สำหรับกรอกข้อมูล
def create_entries():
    global entry_list
    # ล้าง Entry ที่มีอยู่
    for widget in frame_entries.winfo_children():
        widget.destroy()
    entry_list = []
    
    # สร้าง Entry ใหม่ตามคอลัมน์ของตาราง
    table_name = combo_table.get()
    columns = get_columns(table_name)
    
    # ไม่รวมคอลัมน์ E_age ในการสร้าง Entry
    if table_name == "Employee":
        columns = [col for col in columns if col != "E_Age"]
    
    for i, col in enumerate(columns):
        label = Label(frame_entries, text=f"{col}:")
        label.grid(row=i, column=0, padx=10, pady=10)
        entry = Entry(frame_entries)
        entry.grid(row=i, column=1, padx=10, pady=10)
        entry_list.append(entry)

# สร้าง GUI ด้วย Tkinter
root = Tk()
root.title("CoffeeShops Database Management")
root.iconbitmap("coffee_cup.ico")
root.geometry("1000x800")

# Combobox สำหรับเลือกตาราง
label_table = Label(root, text="Select Table:")
label_table.grid(row=0, column=0, padx=10, pady=10)
combo_table = Combobox(root, values=["Employee", "EmployeePhone","CoffeeBeans","Customer", "CustomerEmail", "Department","DepartmentPhone", "Supplyer","SupplyerPhone", "Orders","De_Order", "Receipt","De_Receip"])
combo_table.grid(row=0, column=1, padx=10, pady=10)
combo_table.current(0)

# ปุ่มสร้าง Entry สำหรับกรอกข้อมูล
button_create_entries = Button(root, text="Show Insert column", command=create_entries)
button_create_entries.grid(row=0, column=3, padx=10, pady=10)

# Frame สำหรับกรอกข้อมูล
frame_entries = Frame(root)
frame_entries.grid(row=2, column=0, columnspan=3, padx=10, pady=10)

# Treeview สำหรับแสดงข้อมูล
tree = ttk.Treeview(root, show="headings")
tree.grid(row=1, column=0, columnspan=3, padx=10, pady=10)

# ปุ่มแสดงข้อมูล
button_show = Button(root, text="Show Data", command=show_data)
button_show.grid(row=0, column=2, padx=5, pady=5)

# ปุ่ม Insert, Update, Delete
button_insert = Button(root, text="Insert", command=insert_data)
button_insert.grid(row=3, column=0, padx=10, pady=10)

button_update = Button(root, text="Update", command=update_data)
button_update.grid(row=3, column=1, padx=10, pady=10)

button_delete = Button(root, text="Delete", command=delete_data)
button_delete.grid(row=3, column=2, padx=10, pady=10)

# แสดงข้อมูลเมื่อเริ่มโปรแกรม
show_data()

# รัน GUI
root.mainloop()