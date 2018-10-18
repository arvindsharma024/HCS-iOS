//
//  ContactDatabaseHelper.swift
//  mcpttapp
//
//  Created by Niranjan, Rajabhaiya on 20/09/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation
import SQLite3

let pathSandBox     = NSHomeDirectory()
let pathDocuments   = (pathSandBox as NSString).appendingPathComponent("Documents")
let dataBaseName    = (pathDocuments as NSString).appendingPathComponent("contacts.sqlite")

var dataBase: OpaquePointer? = nil

class ContactDatabaseHelper
{
    //MARK: - Create Table
    func onCreate()
    {
        //Verify database file exists
        if FileManager.default.fileExists(atPath: dataBaseName)
        {
            if sqlite3_open(dataBaseName, &dataBase) == SQLITE_OK
            {
                print("Database is open")
            }
            else
            {
                print("Error: Opening Database")
            }
        }
        else
        {
            if sqlite3_open(dataBaseName, &dataBase) == SQLITE_OK
            {
                let dataBaseTable =    "CREATE TABLE IF NOT EXISTS \(ContactsDBTables.CONTACTS) \(createContactTable)" +
                    "CREATE TABLE IF NOT EXISTS \(ContactsDBTables.GROUPS) \(createGroupTable)" +
                    "CREATE TABLE IF NOT EXISTS \(ContactsDBTables.ADHOCGROUPS) \(createContactRelationTable)" +
                    "CREATE TABLE IF NOT EXISTS \(ContactsDBTables.CONTACT_RELATION) \(createDataTable)" +
                    "CREATE TABLE IF NOT EXISTS \(ContactsDBTables.DATA) \(createGKTPTable)"
                
                if sqlite3_exec(dataBase, dataBaseTable, nil, nil, nil) == SQLITE_OK
                {
                    print("Table is created Successfully")
                }
                else
                {
                    print("Error: Creating table \(String(describing: sqlite3_errmsg(dataBase)))")
                }
            }
            else
            {
                print("Error: Create database")
            }
        }
    }
}
