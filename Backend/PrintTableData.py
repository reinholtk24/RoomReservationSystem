import sqlite3 as lite
import sys

con = lite.connect('RRSDB.db')

with con:

    cur = con.cursor()

    print("room_status")

    cur.execute('PRAGMA table_info(room_status)')
    
    data = cur.fetchall()
    
    for d in data:
        print(d[0], d[1], d[2])


    print("rooms") 
    cur.execute('PRAGMA table_info(rooms)')
    
    data = cur.fetchall()
    
    for d in data:
        print(d[0], d[1], d[2])

    print("building")
    cur.execute('PRAGMA table_info(buildings)')
    
    data = cur.fetchall()
    
    for d in data:
        print(d[0], d[1], d[2])

    print("users") 
    cur.execute('PRAGMA table_info(users)')
    
    data = cur.fetchall()
    
    for d in data:
        print(d[0], d[1], d[2])
