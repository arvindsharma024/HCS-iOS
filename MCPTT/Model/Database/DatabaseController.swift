//
//  DatabaseController.swift
//  MCPTT
//
//  Created by Vinayak Naik on 18/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation
import SQLite3

let dataPath = "\(NSHomeDirectory())/MCPTT/"
var db: OpaquePointer?

class DatabaseController {
    
    init() {
    }
    
    func createDirectory(){
        if (!FileManager.default.fileExists(atPath: dataPath)) {
            try?FileManager.default.createDirectory(atPath: dataPath, withIntermediateDirectories: false, attributes: nil)
        }
    }
    
    func isOpen() -> Bool {
        let flags = SQLITE_OPEN_CREATE | SQLITE_OPEN_READWRITE
        let status =  sqlite3_open_v2(dataPath, &db, flags, nil)
        if status != SQLITE_OK {
            print("error opening database")
            return false
        }
        return true
    }
    
    func execute(query : String){
        if sqlite3_exec(db, query, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error in executing query: \(errmsg)")
        }
    }
    
    // Insert Statement
    func insert(table: String, contentValues: String) -> Int {
        var id: Int = -1
        if isOpen() {
            var statement: OpaquePointer? = nil
            let insertQuery = "INSERT INTO \(table) VALUES (\(contentValues))"
            if  sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
                
                if sqlite3_step(statement) == SQLITE_DONE {
                    id = Int(sqlite3_last_insert_rowid(statement))
                    print("inserted")
                } else {
                    print("Error in Run Statement :- \(String(describing: sqlite3_errmsg16(db)))")
                }
            }
            sqlite3_finalize(statement)
        }
        return id
    }
    
    // update Statement
    func update(table : String, updateValues : String, whereClause: String)-> Int{
        var count: Int = -1
        
        if isOpen(){
            var statement : OpaquePointer? = nil
            let updateQuery = "UPDATE \(table) SET \(updateValues) WHERE \(whereClause)"
            
            if  sqlite3_prepare_v2(db, updateQuery, -1 , &statement, nil) == SQLITE_OK {
                if sqlite3_step(statement) == SQLITE_DONE
                {
                    count = Int(sqlite3_column_count(statement))
                }
                else
                {
                    print("Error in Run Statement :- \(String(describing: sqlite3_errmsg16(db)))")
                }
            }
            sqlite3_finalize(statement)
        }
        return count
    }
    
    // Delete Statement
    func delete(table : String, whereClause : String, args: [String])-> Int{
        var count: Int = -1
        
        if isOpen(){
            var statement : OpaquePointer? = nil

            let select = whereClause.count>0 ? "WHERE \(whereClause)" : ""
            let deleteQuery = "DELETE FROM \(table) \(select)"
            
            if  sqlite3_prepare_v2(db, deleteQuery, -1 , &statement, nil) == SQLITE_OK {
                
                if sqlite3_step(db) == SQLITE_DONE
                {
                    count = Int(sqlite3_column_count(db))
                }
                else
                {
                    print("Error in Run Statement :- \(String(describing: sqlite3_errmsg16(db)))")
                }
            }
            sqlite3_finalize(statement)
            
        }
        return count
    }
    
    
    func select(table: String, whereClause : String, selectionArgs : String, orderBy: String, sortOrder: String)-> [AnyObject]{
        var result = [AnyObject]()
        
        if isOpen(){
            var statement : OpaquePointer? = nil
            let checkArgs       = selectionArgs.count>0 ? selectionArgs : "*"
            let whereStm        = whereClause.count>0 ? "WHERE \(whereClause)" : ""
            let checkOrderBy    = orderBy.count>0 ? "ORDER BY \(orderBy)" : ""
            let checkSortOrder  = sortOrder.count>0 ? sortOrder : ""
            
            let selecttQuery = "SELECT \(checkArgs) FROM \(table) \(whereStm) \(checkOrderBy) \(checkSortOrder)"
        
            if sqlite3_prepare(db, selecttQuery, -1, &statement, nil) == SQLITE_OK{
                
                if sqlite3_step(statement) == SQLITE_DONE
                {
                    while sqlite3_step(statement) == SQLITE_ROW
                    {
                        result.append(statement as AnyObject)
                    }
                }
                else
                {
                    print("Error in Run Statement :- \(String(describing: sqlite3_errmsg16(db)))")
                }
                
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("error preparing insert: \(errmsg)")
                
            }
            sqlite3_finalize(statement)
        }

        return result
    
    }
    
    
    func closeDatabase(){
        if sqlite3_close(db) != SQLITE_OK {
            print("error closing database")
        }
        db = nil
    }

    deinit{
    }

}
