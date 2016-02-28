#Author: Kyle Reinholt
#Date: 2/22/16
#Purpose: To read a CSV file containing userData into a database table
        # named users contained in a test database named test.db
        # and be able to access the information in it and manipulate it. 
#Program: CSVtoSQLite
#Sources: SQLite code for storing csv into sqlite:
""" [1] http://stackoverflow.com/questions/6547658/how-to-remove-u-from-sqlite3-cursor-fetchall-in-python"""
# SQLite Beginner Tutorial to understand the sqlite code:
""" [2] http://zetcode.com/db/sqlitepythontutorial/"""

import csv, sqlite3
 
con = sqlite3.connect("test.db")

listOfEmails = [] # These are containers to store contents from the database in after the information is stored in the DB
listOfNames = []        
listOfDepartments = []  
listOfAdmins = " "      

with con: 

    cur = con.cursor()
    con.text_factory = str
    cur.execute("DROP TABLE IF EXISTS users") #This drops the table if it exists, it has to be here for running this file more than once, you don't want to add the users table to the DB multiple times. 
    cur.execute("CREATE TABLE users (emailAddress, name, department, departmentAdminPriv, password);")

    with open('userData.csv','r') as fin: # `with` statement available in 2.5+
        # csv.DictReader uses first line in file for column headings by default
        dr = csv.DictReader(fin) # comma is default delimiter
        to_db = [(i['emailAddress'], i['name'], i['department'], i['departmentAdminPriv'], i['password']) for i in dr]

    cur.executemany("INSERT INTO users (emailAddress, name, department, departmentAdminPriv, password) VALUES (?, ?, ?, ?, ?);", to_db)

    con.commit()

    cur.execute("SELECT * FROM users")

    row = cur.fetchall() #This grabs each row from the DB and converts it into a tuple

    listOfEmails = [r[0] for r in row]  #This is something I found on stackoverflow to grab all of the first entry in each tuple, refer to source [1] at the top of the page
    listOfNames = [f[1] for f in row]   #This does the same
    listOfDepartments = [l[2] for l in row] # etc. 

    for x in range(0,5):
        if row[x][3] == '1':
            listOfAdmins = listOfAdmins + row[x][1] + " "

    print (listOfEmails)
    print (listOfNames)
    print (listOfDepartments)
    print ("The name of the user(s) with admin privileges is: " + listOfAdmins)

