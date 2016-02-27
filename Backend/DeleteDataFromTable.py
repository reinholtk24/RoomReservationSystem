import sqlite3 as lite
import sys

con = lite.connect('RRSDB.db')

with con:
	cur = con.cursor()

	
