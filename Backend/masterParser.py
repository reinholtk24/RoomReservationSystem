import sqlite3 as lite
import sys


def roomExist(roomNumber, BLDCode):
    room = roomNumber + ','
    con = lite.connect('RRSDB.db')
    with con:
        cur = con.cursor()
        cur.execute("SELECT * FROM rooms WHERE room_number ='" + roomNumber + "' AND building_code ='" + BLDCode + "'")
        roomFound = cur.fetchone()
    if (roomFound == None):
        return False
    else:
        return True


def masterParser( CSVFile ):

    if( CSVFile == "users.csv" ):

        rowsInUsersDataCSV = []
        NUMBEROFCOLUMNSINTABLE = 6
        colsInCurrentRow = []
        
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

                    
        
    elif( CSVFile == "buildings.csv" ):
        print( "update building elif" )
    elif( CSVFile == "rooms.csv" ):
        print( "update rooms elif" )
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
                   #if(roomExist(room_number, building_code)):
                    #    print("the room exist") """ 
                        # roomVerified = True add it to final if statement
                    splitStartDate = start_date.split('/')
                    splitEndDate = end_date.split('/')
                    if (len(splitStartDate) == 3 and len(splitEndDate) == 3):
                        dateVerified = True
                    if (daysVerified and timeVerified and dateVerified):
                        con = lite.connect('RRSDB.db')

                        with con:

                            cur = con.cursor()
                            
                            cur.execute("INSERT OR REPLACE INTO room_status (building_code, room_number, start_time, end_time, SUN, MON, TUE, WED, THR, FRI, SAT, start_date, end_date, id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", (building_code, room_number, start_time, end_time, SUN, MON, TUE, WED, THR, FRI, SAT, start_date, end_date, y,))

                        print("Row " + str(y) + " has been added to the database.")

                    
                    
                       
                       
                        
    else:
        print ("The user has uploaded a file with an incorrect file name. Please refer to documentation section 1.2 File Names.")




masterParser("room_status.csv")        



