#RRSDB csv filepath browser
from tkinter import *
from tkinter.filedialog import askopenfilename
import masterParser

aboutUs = "This program is a room reservation system designed to facilitate room reservations campuswide.\
\nAuthors: Kyle Reinholt, Michael Adedigba, Trevor Walker, Courtney Purtell, Denny Hood"

class main_win(object):
    
    def __init__(self):
        self.scheduleFilePath = ""
        self.builingFilePath = ""
        self.usersFilePath = ""
        self.roomsFilePath = ""
        self.root = Tk() #new tkinter window
        self.root.title("Room Reservation System")
        #room reservation logo
        self.frameLogo = Frame(self.root).pack(fill=X)
        self.logo = Label(self.frameLogo, text="ROOM RESERVATION SYSTEM", font=("Helvetica",20)).pack(fill=X)
        #message about us
        self.frameMessage = Frame(self.root).pack(fill=X)
        message = Label(self.frameMessage, text = aboutUs).pack()
        #frame for filepaths
        self.frameFiles = Frame(self.root).pack(fill=X)
        self.scheduleLabel = Label(self.frameFiles, text="no file selected").pack()
        #buttons for file browser
        self.frameButtons = Frame(self.root).pack(fill=X)
        self.browseSchedule = Button(self.frameButtons, text="Schedule CSV", command=self.browse_schedule_file).pack(side=LEFT)
        self.browseBuilding = Button(self.frameButtons, text='building CSV').pack(side=LEFT)
        self.browseUsers = Button(self.frameButtons, text=' users CSV ').pack(side=LEFT)
        self.browseRooms = Button(self.frameButtons, text=' rooms CSV ').pack(side=LEFT)
        #master submit and quit buttons
        self.submitFrame = Frame(self.root).pack(fill=X)
        self.submitbtn = Button(self.submitFrame, text = "Submit", command=self.submit).pack(side=LEFT)
        self.quitbtn = Button(self.submitFrame, text = " Quit ", command=self.quit_loop).pack(side=LEFT)
    def browse_schedule_file(self):
        self.scheduleFilePath = askopenfilename()
        if self.scheduleFilePath[-4:] != '.csv':
            err = Tk()
            err.title("ERROR")
            Label(err, text = 'not a valid directory!').pack(fill=X)
            Button(err, text = "OK", command=lambda:err.destroy()).pack(side=LEFT)
            Button(err, text = "QUIT", command= lambda:err.destroy()).pack(side=LEFT)
            print('not a valid file')
        else:
            print (self.scheduleFilePath) #name is a string of filepath
    def browse_building_file(self):
        self.buildingFilePath = askopenfilename()
        if self.buildingFilePath[-4:] != '.csv':
            err = Tk()
            err.title("ERROR")
            Label(err, text = 'not a valid directory!').pack(fill=X)
            Button(err, text = "OK", command=lambda:err.destroy()).pack(side=LEFT)
            Button(err, text = "QUIT", command= lambda:err.destroy()).pack(side=LEFT)
            print('not a valid file')
        else:
            print (self.buildingFilePath) #name is a string of filepath
    def browse_users_file(self):
        self.usersFilePath = askopenfilename()
        if self.scheduleFilePath[-4:] != '.csv':
            err = Tk()
            err.title("ERROR")
            Label(err, text = 'not a valid directory!').pack(fill=X)
            Button(err, text = "OK", command=lambda:err.destroy()).pack(side=LEFT)
            Button(err, text = "QUIT", command= lambda:err.destroy()).pack(side=LEFT)
            print('not a valid file')
        else:
            print (self.usersFilePath) #name is a string of filepath
    def browse_rooms_file(self):
        self.roomsFilePath = askopenfilename()
        if self.roomsFilePath[-4:] != '.csv':
            err = Tk()
            err.title("ERROR")
            Label(err, text = 'not a valid directory!').pack(fill=X)
            Button(err, text = "OK", command=lambda:err.destroy()).pack(side=LEFT)
            Button(err, text = "QUIT", command= lambda:err.destroy()).pack(side=LEFT)
            print('not a valid file')
        else:
            print (self.roomsFilePath) #name is a string of filepath

    def submit(self):
        if(self.scheduleFilePath != "" and self.builingFilePath != "" and self.usersFilePath != "" and self.roomsFilePath != ""):
            print("we have all file paths")
            masterParser.masterParser(self.buildingFilePath)
            masterParser.masterParser(self.roomsFilePath)
            masterParser.masterParser(self.usersFilePath)
            masterParser.masterParser(self.scheduleFilePath)
        else:
            print("we didn't get them all")
    def quit_loop(self):
        self.root.destroy()


new_win = main_win()
