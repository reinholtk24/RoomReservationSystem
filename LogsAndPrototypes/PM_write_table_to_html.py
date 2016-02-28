#Title: PM_write_table_to_HTML
#Author: Denny Hood
#Description: this module contains a function that will read in a table and a
#file pointer and store the table in HTML format in the location pointed to by
#the file pointer

def write_table_to_html(fileIn,tableIn):
    #fileIn is a file pointer passed in
    #tableIn is a list of lists where is each list is a row in the output table
    #and each column in the row is the list of data in the table
    fileIn.write('\n<table border="1" style="width:100%">\n')
    value = len(tableIn[0])#store number of columns in table as an integer
    for row in tableIn:
        fileIn.write('<tr>\n')
        for position in range(0,value): #position is an integer between 0 and
                                        #the number of columns in the table
            fileIn.write('\t<td>'+\
                         row[position]+\
                         '</td>\n')#row[position] is element in column
        fileIn.write('</tr>\n')
        
    fileIn.write('</table>') #close table after writing to table
              
