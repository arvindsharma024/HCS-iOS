//
//  DatabaseController.swift
//  MCPTT
//
//  Created by Vinayak Naik on 18/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation
import SQLite3

class DatabaseController {
    
    //MARK: - Insert data
    func insert(query : String) {
        
        if sqlite3_exec(dataBase, query, nil, nil, nil) == SQLITE_OK
        {
            print("Inserted Successfully")
        }
        else
        {
            print("Error: Insert data", sqlite3_errmsg(dataBase))
        }
    }
    
    //MARK: - Delete data
    func delete(query : String)
    {
        if sqlite3_exec(dataBase, query, nil, nil, nil) == SQLITE_OK
        {
            print("The file has been deleted")
        }
        else
        {
            print("Error: Delete file")
        }
    }
    
    //MARK: - Update data
    func upDate(query : String)
    {
        if sqlite3_exec(dataBase, query, nil, nil, nil) == SQLITE_OK
        {
            print("Updated Sucessfully")
        }
        else
        {
            print("Error: Update \(String(describing: sqlite3_errmsg(dataBase)))")
        }
    }
    
}
