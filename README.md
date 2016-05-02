# RoomReservationSystem
***
AUTHORS: Denny Hood, Michael Adidegba, Courtney Purtell, Trevor Walker, and Kyle Reinholt    
Date: 01/19/16    

This is for a undergraduate college course group assignment. CS 410 Software Engineering    
 
# Contents of Repository
***
- [LogsAndPrototypes](https://github.com/reinholtk24/RoomReservationSystem/tree/master/LogsAndPrototypes)
- [Frontend](#frontend)
- [Backend](#backend)  

#LogsAndPrototypes

This folder contains work logs for our group members and also proof of concept modules for CSV file manipulation and other prototype implementations.   

#Backend 

These are the backend files for the Room Reservation System.    
Sqlite was utilized for local host reasons.
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

Contains 5 tables right now (this may change with time): 

|TABLEs                              |           
| ---------------------------------- |   
| users                              |    
| rooms                              |    
| buildings                          |    
| room_status                        |    
| room_reservation                   |  
  
    

For table data definitions, refer to this:    
[Table Formats](https://docs.google.com/document/d/1TuH4QXDVmixivNLMd0GYS0jrRGVwHpqipmDEyQk-xdA/edit?usp=sharing)    
[ER-Model](https://docs.google.com/document/d/1WUespPPC7Xdgn-7NbcA1Erd0Y627aoqP_rCsXExPpnA/edit?pref=2&pli=1)

room_status.csv and users.csv are used as example files for the masterParser.py 

TODO: Create a GUI for the user to specify file paths and populate the database with their institutions room and user info. 

#Frontend 

Here is where all of the frontend files for the Room Reservation System are stored.    
The Frontend was programmed in C# using Visual Studio as the IDE and ASP.NET for the web-framework.          
Web Forms was used as the ASP.NET development Model for the Website.     

<b>Initial Setup</b>
______________
In order to compile this project you must first make sure to download    
the correct version of the sqlite.data reference library for your operating system and version of visual studio. You must aslo   
specify the path in the webconfig.cs file for the sqlite connection string. Replace the current path with your local path to   
your copy of RRSDB.db. After that, locate a line similiar to this your IIS configuration file: directoryBrowse enabled = false    
Edit that line to look like this: directoryBrowse enabled = true     

These are the most relevant files from the front end:    

- [Home.aspx](#Home.aspx)
- [Home.aspx.cs](#Home.aspx.cs) 
- Account/Login.aspx
- Account/Login.aspx.cs
- Account/ViewRooms.aspx
- Account/ViewRooms.aspx.cs 

#Home.aspx

This file contains the layout for the homepage. Keep in mind that this site is intended for integration with an existing system.     
There is not any navigation, or explanations about the website on this page. It is a user interface intended for the user to select a building,
date, and time so that the a list of availble rooms from that institution may be populated and presented to the user.    

TODO: Finish this list with the correct identifiers     
This file consists of the following Web Objects:     
1. Sqlite Data Connection      
2. Rooms Available GridView      
3. Date Calendar      
4. button1     
5. button2      
6. Label errorLabel     
7. Label2     
8. Label3    
9. roomSelected Button     
   
#Home.aspx.cs

The documentation can be found [here](https://docs.google.com/document/d/1aPTLqmRvrRfCIpIRCFBxSbD_gB8UD-1lW0luMyJS6NE/edit?pref=2&pli=1)       
The file can be found [here](https://github.com/reinholtk24/RoomReservationSystem/blob/clean/Frontend/Site/WebSite1/Home.aspx.cs)

#Account/Login.aspx

#Account/Login.aspx.cs
      
       
The documentation for this file can be found: [HERE]( https://docs.google.com/document/d/16dJQti6UH3iY_mHECg9GdlY2FKzWbezxdecaAWbLJuc/edit)           
The code can be found: [HERE]( https://github.com/reinholtk24/RoomReservationSystem/blob/master/Frontend/Site/WebSite1/Account/Login.aspx.cs)           

#Account/ViewRooms.aspx

#Account/ViewRooms.aspx.cs 
The documentation for this file can be found: [HERE](https://docs.google.com/document/d/1UnjlIQ7Nfa_yYB_4yQtKWoqZJ1-AjmZwNVfXI2_eC04/edit?usp=sharing)           
The code can be found: [HERE]( https://github.com/reinholtk24/RoomReservationSystem/blob/master/Frontend/Site/WebSite1/Account/ViewRooms.aspx.cs)     




