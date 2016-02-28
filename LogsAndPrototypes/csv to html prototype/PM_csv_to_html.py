#Title: PM_csv_to_html
#Author: Denny Hood
#Description: this module will read in a user specified csv file and create a
#table in an HTML page named tablewebpage.html

import csv                                       #included python module
import PM_write_table_to_html as tablewriter     #user defined module
import PM_default_html_page_writer as pagewriter #user defined module

table = [] #the name of the list that will consist of lists for each row in the
           #csv spreadsheet

with open('WN2016.csv') as csvfile:
    currentValue = csv.reader(csvfile, delimiter=',')
    #build list of table rows:
    for row in currentValue:
        table.append(row) #add row as a list of columns to table

#we now have a list of lists
#generate a webpage and put the table in it
fileptr = open("tablewebpage.html","w")
pagewriter.open_html(fileptr,"room reservation")
pagewriter.write_open_body(fileptr)
fileptr.write("<h1>Table data:</h1>") #pagewrite doesn't have a write method
                                      #for HTML tags for example the <h1></h1>
tablewriter.write_table_to_html(fileptr,table) #write the table to website
pagewriter.write_close_body(fileptr)
fileptr.close()
print('"tablewebpage.html" written to file')

