#tkinter filebrowser
from tkinter import *
#from tkFileDialog   import askopenfilename
from tkinter.filedialog import askopenfilename

aboutUs = "This program is a room reservation system designed to facilitate room reservations campuswide.\
\nAuthors: Kyle Reinholt, Michael Adedigba, Trevor Walker, Courtney Purtell, Denny Hood"

def escape():
    err.destroy()
def quit_loop():
    root.destroy()

def callback():
    name= askopenfilename()
    if name[-4:] != '.csv':
        err = Tk()
        Label(err, text = 'not a valid directory!').pack(fill=X)
        Button(err, text = "OK", command=escape).pack(side=LEFT)
        Button(err, text = "QUIT", command=quit_loop).pack(side=LEFT)
        print('not a valid directory')
    else:
        print (name) #name is a string of filepath

root = Tk()
#room reservation logo----------------------------
frameLogo = Frame(root).pack(fill=X)
logo= Label(frameLogo, text="ROOM RESERVATION SYSTEM", font=("Helvetica",20)).pack(fill=X)
#message text about how to use--------------------
frameMessage = Frame(root).pack(fill=X)
message = Label(frameMessage, text=aboutUs ).pack()
#buttons to click to prompt user for filepaths----
frameButtons = Frame(root).pack(fill=X)
Button(frameButtons, text='building CSV', command=callback).pack(side=LEFT)
Button(frameButtons, text='users CSV', command=callback).pack(side=LEFT)
Button(frameButtons, text='course schedule CSV', command=callback).pack(side=LEFT)
Button(frameButtons, text='QUIT', command=quit_loop).pack(side=LEFT)
mainloop()
