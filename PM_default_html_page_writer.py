#Title: PM_default_html_page_writer
#Author: Denny Hood
#Description: this module is a list of functions to write in the body of an HTML
#file
def open_html(fileIn,titleIn):
#this function will create the HTML header and title of page from titleIn
    fileIn.write('<!DOCTYPE html>\n'+\
                 '<html>\n'+\
                 '<head>\n'+\
                 '<title>'+\
                 titleIn+\
                 '</title>\n'+\
                 '</head>\n')
    
def write_open_body(fileIn):
#this function will create a body tag in HTML
    fileIn.write('<body>\n')

def write_close_body(fileIn):
#this function will close the body of an HTML and create a footer with the
#names of the authors
    fileIn.write('\n<footer align="center">\n'+\
                 '<p>Website created by Courtney, Denny, Kyle & Michael</p>'+\
                 '</footer>\n'+\
                 '\n</body>\n'+\
                 '</html>')
    
    
