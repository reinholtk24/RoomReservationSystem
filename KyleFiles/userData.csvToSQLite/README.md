***    
This folder contains the following:    

- An SQLite Database    
- A CSV File Containting Proof of Concept User Data    
- A Python Program to Read CSV into a Database then Manipulate the Data   


*** 
Program Flow    
***

1. The program connects to the database    
2. It checks to see if the table "users" is in the database and deletes it if it finds the table 
3. Then, the format for the database is established (emailAddress, name, department, departmentAdminPriv, password) 
4. The CSV file is opened and the first line is read into the database as column categories by default 
5. The information is stored into the database 
6. Next, the information from the database is converted into a list of tuples with the line: row = cur.fetchall() 
7. The tuples can then be manipulated to do pretty much anything. 
