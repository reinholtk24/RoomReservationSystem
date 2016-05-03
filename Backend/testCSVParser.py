


with open('room_status.csv', 'r') as roomsData:

        read_data = roomsData.read()
        rowsInUsersDataCSV = read_data.split("\n")

        myList = []
            
        for x in range(1, (len(rowsInUsersDataCSV)-1)):

            currentRow = rowsInUsersDataCSV[x]
            colsInCurrentRow = currentRow.split(',')
            atSymbolCounter = 0

            building_code = colsInCurrentRow[0].strip()
            room_number = colsInCurrentRow[1].strip()

            line = building_code + "," + room_number

            myList.append(line)



        for thing in myList:
            print ( thing ) 
                        
        mySet = set(myList)


        print("NOW PRINTING ELEMENTS IN THE SET") 
        
        for thingy in mySet:
            print (thingy)


f = open('newRooms.csv', 'w')

for things in mySet:
    if(things[:5] == "SCIEN"):
        things = things + ", winfrey@concord.edu, 35, 0, 1, 0, 1" + "\n"
        f.write(things)
    else: 
        things = things + ", noOwner@concord.edu, 40, 0, 1, 1, 0" + "\n"
        f.write(things)

f.close()     
               
        
