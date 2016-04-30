################################################################################
#Please note, we need to simplify the masterParser, we don't need to open the  #
#database based on which csv file we want to parse and add to the database.    #
################################################################################

import sqlite3 as lite
import sys
import csv #need this for the csv reader method! # I think there are too many comments

def roomExist(roomNumber, BLDCode):
    print(roomNumber + " and " + BLDCode )
    room = roomNumber + ','
    con = lite.connect('RRSDB.db')
    with con:
        cur = con.cursor()
        cur.execute("SELECT * FROM rooms WHERE room_number ='" + roomNumber + "' AND building_code ='" + BLDCode + "'")
        roomFound = cur.fetchone()

    if(roomFound == None):
        return False
    else:
        Blah = []
        blah = roomFound
        print(roomFound)
        return True

def masterParser( CSVFile ):

    if( CSVFile == "users.csv" ):

        rowsInUsersDataCSV = [] #Stores each row from the csv file in a string. 
        NUMBEROFCOLUMNSINTABLE = 6
        colsInCurrentRow = [] #Stores each column in the current row, each location contains a string 
        
        with open('users.csv', 'r') as usersData:

            read_data = usersData.read()
            rowsInUsersDataCSV = read_data.split("\n")
            
            for x in range(1, (len(rowsInUsersDataCSV)-1)):

                currentRow = rowsInUsersDataCSV[x]
                colsInCurrentRow = currentRow.split(',')
                atSymbolCounter = 0

                if( len(colsInCurrentRow) == NUMBEROFCOLUMNSINTABLE):

                    email_address = colsInCurrentRow[0].strip()
                    first_name = colsInCurrentRow[1].strip()
                    last_name = colsInCurrentRow[2].strip()
                    department = colsInCurrentRow[3].strip()
                    password = colsInCurrentRow[4].strip()
                    admin = colsInCurrentRow[5].strip()

                    for character in email_address:
                        if(character == '@'):
                            atSymbolCounter = atSymbolCounter + 1
                        else:
                            continue
                        
                    if(atSymbolCounter == 1):
                        atVerified = 1
                    else:
                        print(" Email address on row " + str(x) + " is incorrect." )


                    
                    if( email_address[-4:] == ".edu" ):
                        eduVerified = 1
                    else:
                        print(" Email address on row " + str(x) + " needs .edu for the last four characters of the email address." )

                    if(atVerified == 1 and eduVerified == 1 and (int(admin) == 0 or int(admin) == 1)):

                        con = lite.connect('RRSDB.db')

                        with con:

                            cur = con.cursor()
                            
                            cur.execute("INSERT OR REPLACE INTO users (university_email, first_name, last_name, department, password, admin) values (?, ?, ?, ?, ?, ?)", (email_address, first_name, last_name, department, password, admin,))

                        print("Row " + str(x) + " has been added to the database.")


                    else:
                        print("There was an error adding row: " + str(x) + " to the database." ) 
                    
                    
                else:
                    print ("The user has input a comma in row " + str(x) + " .")

                    
#Denny and Trevor's parsers ####################################################        
    elif( CSVFile == "buildings.csv" ):
        #this parser will read in buildings.csv, validate data and store the csv
        #in a list of lists
        sqlite_dbname = 'RRSDB.db'
        NUMBEROFCOLUMNSINBUILDINGTABLE = 8 #global constant
        buildings = [] #buildings will be a list of lists
        with open('buildings.csv', newline = '') as buildingsfile:
            rowCount = 1
            temp = csv.reader(buildingsfile, delimiter = ',', quotechar='"')
            for row in temp:
                #check to make sure row has 8 fields
                if len(row) != NUMBEROFCOLUMNSINBUILDINGTABLE:
                    print("Error, row ",rowCount," does not have 8 column entries!")
                    break
                #check to make sure building name building_code are not empty
                if row[0] == "" or row[1] == "":
                    print("Row error on row ",rowCount, " building name or building_code is empty!")
                    break
                #check for valid times 0<= time <=2400
                for colValue in range(2,8):
                    if int(row[colValue]) not in range(0,2401):
                        print("Row error on row ",colValue, " time is not in range 0 to 2400!")
                        break
                    else:
                        row[colValue] = int(row[colValue]) #convert time to INTEGER
                rowCount += 1
                buildings.append(row)

        #write list of lists to DB
        #connect to DB
        conn = lite.connect(sqlite_dbname)
        cur = conn.cursor()
        for building in buildings:
            #check to make sure data doesn't exit in table
            #building[0] #building name
            #split buildings into parts and store in each building table
            cur.execute("INSERT INTO buildings VALUES(?,?,?,?,?,?,?,?)",building)
        #commit changes and close
        conn.commit()
        conn.close()
        
    elif( CSVFile == "rooms.csv" ):
        #this parser will read in rooms.csv, validate the data and store the csv
        #in a list of lists
        sqlite_dbname = 'RRSDB.db'
        NUMBEROFCOLUMNSINROOMSTABLE = 8 #global constant
        rooms = [] #buildings will be a list of lists
        with open('rooms.csv', newline = '') as roomsfile:
            rowCount = 1
            temp = csv.reader(roomsfile, delimiter = ',', quotechar='"')
            for row in temp:
                row[0] = row[0].strip()
                row[1] = row[1].strip()
                #check to make sure row has 8 fields
                if len(row) != NUMBEROFCOLUMNSINROOMSTABLE:
                    print("Error, row ",rowCount," does not have 8 column entries")
                    break
                #make sure building code and room number are not empty
                elif row[0] == "" or row[1] == "":
                    row[0] = row[0].strip()
                    row[1] = row[1].strip()
                    print("Row error on row ",rowCount, " building name or building_code is empty!")
                    break
                #check to make sure owner has "@" symbol and ends in '.edu'
                elif '@' not in row[2]:
                    print("Invalid email address in row ",rowCount)
                    break
                #check to make sure seats > 0
                elif int(row[3]) <= 0:
                    print("Invalid number of seats in row ",rowCount)
                    break
                #check to make sure technology has 1 for True, otherwise put 0
                for i in range(4,8):
                    if int(row[i]) == 1:
                        row[i] = int(row[i])
                    else:
                        row[i] = 0
                rowCount += 1
                rooms.append(row)

        #write list of lists to DB
        #connect to DB
        conn = lite.connect(sqlite_dbname)
        cur = conn.cursor()
        for room in rooms:
            #split rooms into room and store each in rooms table
            cur.execute("INSERT OR REPLACE INTO rooms VALUES(?,?,?,?,?,?,?,?)",room)
        #commit changes and close
        conn.commit()
        conn.close()            
        
#End Denny and Trevor's parsers ################################################
    elif( CSVFile == "room_status.csv" ):
        
        rowsInUsersDataCSV = []
        NUMBEROFCOLUMNSINTABLE = 13
        colsInCurrentRow = []
        
        with open('room_status.csv', 'r') as usersData:

            read_data = usersData.read()
            rowsInUsersDataCSV = read_data.split("\n")
            
            for y in range(1, (len(rowsInUsersDataCSV)-1)):
                daysVerified = False
                timeVerified = False
                dateVerified = False
                roomVerified = False
                
                roomNumber = 0
                currentRow = rowsInUsersDataCSV[y]
                colsInCurrentRow = currentRow.split(',')

                if( len(colsInCurrentRow) == NUMBEROFCOLUMNSINTABLE):

                    building_code = colsInCurrentRow[0].strip()
                    room_number = colsInCurrentRow[1].strip()
                    start_time = colsInCurrentRow[2].strip()
                    end_time = colsInCurrentRow[3].strip()
                    SUN = colsInCurrentRow[4].strip()
                    MON = colsInCurrentRow[5].strip()
                    TUE = colsInCurrentRow[6].strip()
                    WED = colsInCurrentRow[7].strip()
                    THR = colsInCurrentRow[8].strip()
                    FRI = colsInCurrentRow[9].strip()
                    SAT = colsInCurrentRow[10].strip()
                    start_date = colsInCurrentRow[11].strip()
                    end_date = colsInCurrentRow[12].strip()

                    if( (int(SUN) == 0 or int(SUN) == 1 or SUN == "") and (int(MON) == 0 or int(MON) == 1 or MON == "") and (int(TUE) == 0 or int(TUE) == 1 or TUE == "") and (int(WED) == 0 or int(WED) == 1 or WED == "") and (int(THR) == 0 or int(THR) == 1 or THR == "") and (int(FRI) == 0 or int(FRI) == 1 or FRI == "") and (int(SAT) == 0 or int(SAT) == 1 or SAT == "")):
                        daysVerified = True
                    else:
                        print("Invalid day format on line " + str(y))

                    if ((int(start_time) > 0 and int(start_time) < 2401) and (int(end_time) > 0 and int(end_time) < 2401)):
                        timeVerified = True
                    else:
                        print("Invalid time format on line " + str(y))
                    
                    if(roomExist(room_number, building_code)):
                        print("the room exist")
                        roomVerified = True
                    else: 
                        print("The room on line" + str(y) + " is invalid.") 

                    splitStartDate = start_date.split('/')
                    splitEndDate = end_date.split('/')
                    if (len(splitStartDate) == 3 and len(splitEndDate) == 3):
                        dateVerified = True
                    else: 
                        print("The date on line " + str(y) + " is invalid.")

                    if (daysVerified and timeVerified and dateVerified and roomVerified):

                        con = lite.connect('RRSDB.db')

                        with con:

                            cur = con.cursor()
                            
                            cur.execute("INSERT OR REPLACE INTO room_status (building_code, room_number, start_time, end_time, SUN, MON, TUE, WED, THR, FRI, SAT, start_date, end_date, id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", (building_code, room_number, start_time, end_time, SUN, MON, TUE, WED, THR, FRI, SAT, start_date, end_date, y,))

                        print("Row " + str(y) + " has been added to the database.")

                    else: 
            
                        print("There was an error in row " + str(y) + " The information could not be added to the database.")                     
                    
                       
                       
                        
    else:
        print ("The user has uploaded a file with an incorrect file name. Please refer to documentation section 1.2 File Names.")




masterParser("rooms.csv")        



