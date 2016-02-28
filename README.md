# RoomReservationSystem
***
AUTHORS: Denny Hood, Michael Adidegba, Courtney Purtell, Trevor Walker, and Kyle Reinholt    
Date: 01/19/16    

This is for a undergraduate college course group assignment. CS 410 Software Engineering    
 
# Contents of Repository
***
- LogsAndPrototypes
- Frontend
- Backend 

#LogsAndPrototypes

This folder contains work logs for our group members and also proof of concept modules for CSV file manipulation and other prototype implementations.   

#Backend 

These are the backend files for the Room Reservation System.    
This is a list of the relevant files (The other files are for testing):    

- masterParser.py
- RRSDB.db
- room_status.csv
- users.csv    


masterParser.py:     

masterParser( CSVFile ) is the main function and takes a .csv as a parameter.    
Utilize this function to read in a CSV file named room_status.csv, users.csv, rooms.csv, buildings.csv, to    
get error check the column formats of each and load the data into a database named RRSDB.db. For the CSV format for each file,     
please refer to section 1.2 File Format in the user's manual. (user's manual will be in a folder on the main page soon) 

RRSDB.db    

Contains 4 tables right now (this may change with time): 

TABLEs in RRSDB.db 
+-------------------------------------------------------+    
| users                                                 |    
| rooms                                                 |    
| buildings                                             |    
| room_status                                           |    
| TODO: add a room_reservation table                    |    
+-------------------------------------------------------+     

For table data definitions, refer to this:    
[Table Formats](https://docs.google.com/document/d/1TuH4QXDVmixivNLMd0GYS0jrRGVwHpqipmDEyQk-xdA/edit?usp=sharing)    

room_status.csv and users.csv are used as example files for the masterParser.py    

#Frontend 

Here is where all of the frontend files for the Room Reservation System are stored.    
This folder is currently empty. TODO: Create a frontend     






