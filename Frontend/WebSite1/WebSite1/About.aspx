﻿<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>ROOM RESERVATION SYSTEM<%: Title %></h2>
    <p>&nbsp;</p>
    <h1 style="box-sizing: border-box; font-size: 2.25em; margin-top: 0px !important; margin-right: 0px; margin-bottom: 16px; margin-left: 0px; line-height: 1.2; font-weight: bold; padding-bottom: 0.3em; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(238, 238, 238); color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">RoomReservationSystem</h1>
    <hr style="box-sizing: content-box; height: 4px; margin: 16px 0px; overflow: hidden; border: 0px none; padding: 0px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background: rgb(231, 231, 231);" />
    <p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        AUTHORS: Denny Hood, Michael Adidegba, Courtney Purtell, Trevor Walker, and Kyle Reinholt<br style="box-sizing: border-box;" />
        Date: 01/19/16</p>
    <p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        This is for a undergraduate college course group assignment. CS 410 Software Engineering</p>
    <h1 style="box-sizing: border-box; font-size: 2.25em; margin: 1em 0px 16px; line-height: 1.2; font-weight: bold; padding-bottom: 0.3em; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(238, 238, 238); color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><a id="user-content-contents-of-repository" aria-hidden="true" class="anchor" href="https://github.com/reinholtk24/RoomReservationSystem#contents-of-repository" style="box-sizing: border-box; color: rgb(64, 120, 192); text-decoration: none; display: inline-block; padding-right: 2px; margin-left: -18px; line-height: 1; background-color: transparent;">
        <svg aria-hidden="true" class="octicon octicon-link" height="16" role="img" version="1.1" viewbox="0 0 16 16" width="16">
            <path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path>
        </svg>
        </a>Contents of Repository</h1>
    <hr style="box-sizing: content-box; height: 4px; margin: 16px 0px; overflow: hidden; border: 0px none; padding: 0px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background: rgb(231, 231, 231);" />
    <ul style="box-sizing: border-box; padding: 0px 0px 0px 2em; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        <li style="box-sizing: border-box;">LogsAndPrototypes</li>
        <li style="box-sizing: border-box;">Frontend</li>
        <li style="box-sizing: border-box;">Backend</li>
    </ul>
    <h1 style="box-sizing: border-box; font-size: 2.25em; margin: 1em 0px 16px; line-height: 1.2; font-weight: bold; padding-bottom: 0.3em; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(238, 238, 238); color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><a id="user-content-logsandprototypes" aria-hidden="true" class="anchor" href="https://github.com/reinholtk24/RoomReservationSystem#logsandprototypes" style="box-sizing: border-box; color: rgb(64, 120, 192); text-decoration: none; display: inline-block; padding-right: 2px; margin-left: -18px; line-height: 1; background-color: transparent;">
        <svg aria-hidden="true" class="octicon octicon-link" height="16" role="img" version="1.1" viewbox="0 0 16 16" width="16">
            <path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path>
        </svg>
        </a>LogsAndPrototypes</h1>
    <p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        This folder contains work logs for our group members and also proof of concept modules for CSV file manipulation and other prototype implementations.</p>
    <h1 style="box-sizing: border-box; font-size: 2.25em; margin: 1em 0px 16px; line-height: 1.2; font-weight: bold; padding-bottom: 0.3em; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(238, 238, 238); color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><a id="user-content-backend" aria-hidden="true" class="anchor" href="https://github.com/reinholtk24/RoomReservationSystem#backend" style="box-sizing: border-box; color: rgb(64, 120, 192); text-decoration: none; display: inline-block; padding-right: 2px; margin-left: -18px; line-height: 1; background-color: transparent;">
        <svg aria-hidden="true" class="octicon octicon-link" height="16" role="img" version="1.1" viewbox="0 0 16 16" width="16">
            <path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path>
        </svg>
        </a>Backend</h1>
    <p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        These are the backend files for the Room Reservation System.<br style="box-sizing: border-box;" />
        This is a list of the relevant files (The other files are for testing):</p>
    <ul style="box-sizing: border-box; padding: 0px 0px 0px 2em; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        <li style="box-sizing: border-box;">masterParser.py</li>
        <li style="box-sizing: border-box;">RRSDB.db</li>
        <li style="box-sizing: border-box;">room_status.csv</li>
        <li style="box-sizing: border-box;">users.csv<br style="box-sizing: border-box;" />
        </li>
    </ul>
    <p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        masterParser.py:</p>
    <p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        masterParser( CSVFile ) is the main function and takes a .csv as a parameter.<br style="box-sizing: border-box;" />
        Utilize this function to read in a CSV file named room_status.csv, users.csv, rooms.csv, buildings.csv, to<br style="box-sizing: border-box;" />
        get error check the column formats of each and load the data into a database named RRSDB.db. For the CSV format for each file,<br style="box-sizing: border-box;" />
        please refer to section 1.2 File Format in the user&#39;s manual. (user&#39;s manual will be in a folder on the main page soon)</p>
    <p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        RRSDB.db</p>
    <p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        Contains 4 tables right now (this may change with time):</p>
    <table style="box-sizing: border-box; border-collapse: collapse; border-spacing: 0px; margin-top: 0px; margin-bottom: 16px; display: block; width: 887.778px; overflow: auto; word-break: keep-all; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        <thead style="box-sizing: border-box;">
            <tr style="box-sizing: border-box; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(204, 204, 204); background-color: rgb(255, 255, 255);">
                <th style="box-sizing: border-box; padding: 6px 13px; font-weight: bold; border: 1px solid rgb(221, 221, 221);">TABLEs</th>
            </tr>
        </thead>
        <tbody style="box-sizing: border-box;">
            <tr style="box-sizing: border-box; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(204, 204, 204); background-color: rgb(255, 255, 255);">
                <td style="box-sizing: border-box; padding: 6px 13px; border: 1px solid rgb(221, 221, 221);">users</td>
            </tr>
            <tr style="box-sizing: border-box; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(204, 204, 204); background-color: rgb(248, 248, 248);">
                <td style="box-sizing: border-box; padding: 6px 13px; border: 1px solid rgb(221, 221, 221);">rooms</td>
            </tr>
            <tr style="box-sizing: border-box; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(204, 204, 204); background-color: rgb(255, 255, 255);">
                <td style="box-sizing: border-box; padding: 6px 13px; border: 1px solid rgb(221, 221, 221);">buildings</td>
            </tr>
            <tr style="box-sizing: border-box; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(204, 204, 204); background-color: rgb(248, 248, 248);">
                <td style="box-sizing: border-box; padding: 6px 13px; border: 1px solid rgb(221, 221, 221);">room_status</td>
            </tr>
            <tr style="box-sizing: border-box; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(204, 204, 204); background-color: rgb(255, 255, 255);">
                <td style="box-sizing: border-box; padding: 6px 13px; border: 1px solid rgb(221, 221, 221);">TODO: add a room_reservation table</td>
            </tr>
        </tbody>
    </table>
    <p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        For table data definitions, refer to this:<br style="box-sizing: border-box;" />
        <a href="https://docs.google.com/document/d/1TuH4QXDVmixivNLMd0GYS0jrRGVwHpqipmDEyQk-xdA/edit?usp=sharing" style="box-sizing: border-box; color: rgb(64, 120, 192); text-decoration: none; background-color: transparent;">Table Formats</a></p>
    <p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        room_status.csv and users.csv are used as example files for the masterParser.py</p>
    <h1 style="box-sizing: border-box; font-size: 2.25em; margin: 1em 0px 16px; line-height: 1.2; font-weight: bold; padding-bottom: 0.3em; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(238, 238, 238); color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><a id="user-content-frontend" aria-hidden="true" class="anchor" href="https://github.com/reinholtk24/RoomReservationSystem#frontend" style="box-sizing: border-box; color: rgb(64, 120, 192); text-decoration: none; display: inline-block; padding-right: 2px; margin-left: -18px; line-height: 1; background-color: transparent;">
        <svg aria-hidden="true" class="octicon octicon-link" height="16" role="img" version="1.1" viewbox="0 0 16 16" width="16">
            <path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path>
        </svg>
        </a>Frontend</h1>
    <p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px !important; color: rgb(51, 51, 51); font-family: 'Helvetica Neue', Helvetica, 'Segoe UI', Arial, freesans, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28.4444px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        Here is where all of the frontend files for the Room Reservation System are stored.<br style="box-sizing: border-box;" />
        This folder is currently empty. TODO: Create a frontend</p>
    <p>&nbsp;</p>
    <p>Michael, Kyle, Courtney, Denny, Trevor</p>
</asp:Content>