//
//  DBConnector.swift
//  DemoApp
//
//  Created by arun-pt6232 on 15/03/23.
//

import Foundation
import SQLite3

class DBConnector {
    
    static let shared = DBConnector()
    private var dbPointer: OpaquePointer?
    let dbUtils = DBUtils()
    private init() { }
    
    private var fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appending(component: "demoApp.sqlite")
    
    var errorMsg: String {
            get {
                
                if let error = sqlite3_errmsg(dbPointer) {
                    let errorMsg = String(cString: error)
                    return errorMsg
                } else {
                    return "No error message recieved"
                }
            }
        }
    
    func openDatabase() {
        if sqlite3_open(fileURL.path(), &dbPointer) == SQLITE_OK {
            print("Opened Database Successfully \(fileURL.path)")
            dbUtils.createTables()
        }
        else {
            print("Can't create Database")
        }
    }
    
    func createTable(tableName: String, column: [String]) -> Bool {
        let columnsStr = column.joined(separator: ", ")
        let query = "\(DBConstant.CREATE_TABLE_IF_NOT_EXISTS) \(tableName) (\(columnsStr))"
        
        return execute(query: query)
    }
    
    func insert(tableName: String, values: [String: Any]) -> Bool {
        
        if !values.isEmpty {
            let columns = values.keys.joined(separator: ", ")
            let placeholders = Array(repeating: "?", count: values.count).joined(separator: ", ")
            let valuesArr = Array(values.values)
            let insertQuery = DBConstant.INSERT_INTO + " " + tableName + " (" + columns + ") " + DBConstant.VALUES + " (" + placeholders + ")"
            
            return execute(query: insertQuery, values: valuesArr)
        }
        return false
    }

    
     func execute(query: String, values: [Any] = []) -> Bool {
        var isQuerysuccess = false
        var statement: OpaquePointer?

        // Prepare the statement
        if sqlite3_prepare_v2(dbPointer, query, -1, &statement, nil) == SQLITE_OK {
            
            // Bind the values to the statement
            for (index, value) in values.enumerated() {
                let parameterIndex = Int32(index + 1)
                
                if let stringValue = value as? String {
                    sqlite3_bind_text(statement, parameterIndex, NSString(string: stringValue).utf8String, -1, nil)
                }
                else if let intValue = value as? Int {
                    sqlite3_bind_int(statement, parameterIndex, Int32(intValue))
                }
                else if let doubleValue = value as? Double {
                    sqlite3_bind_double(statement, parameterIndex, doubleValue)
                }
                else if let dataValue = value as? Data {
                    sqlite3_bind_blob(statement, parameterIndex, (dataValue as NSData).bytes, Int32(dataValue.count), nil)
                }
                else if let boolValue = value as? Bool {
                    let boolIntValue = boolValue ? 1 : 0
                    sqlite3_bind_int(statement, parameterIndex, Int32(boolIntValue))
                }
                else {
                    // Unsupported data type
                    print("unsupported data type")
                    break
                }
            }

            // Execute the statement
            if sqlite3_step(statement) == SQLITE_DONE {
                isQuerysuccess = true
            } else {
                print(errorMsg)
            }
        }  else {
            print(errorMsg)
            isQuerysuccess = false
        }
        
        sqlite3_finalize(statement)
        return isQuerysuccess
    }
        
        func select(tableName: String, whereClause: String? = nil, args: [Any]? = nil, selectColumn: String = "*", joinsQuerry: String = "") -> [[String: Any]]? {

            var results: [[String: Any]]?
            let query = "SELECT \(selectColumn) FROM \(tableName) \(joinsQuerry) \(whereClause != nil ? "WHERE \(whereClause!)" : "")"
            var prepare: OpaquePointer?

            if sqlite3_prepare_v2(dbPointer, query, -1, &prepare, nil) == SQLITE_OK {
                if let args = args {
                    // Bind the parameters to the statement
                    for index in 0..<args.count {
                        if let value = args[index] as? String {
                            sqlite3_bind_text(prepare, Int32(index + 1), (value as NSString).utf8String, -1, nil)
                        } else if let value = args[index] as? Int {
                            sqlite3_bind_int(prepare, Int32(index + 1), Int32(value))
                        } else if let value = args[index] as? Double {
                            sqlite3_bind_double(prepare, Int32(index + 1), value)
                        } else if args[index] is NSNull {
                            sqlite3_bind_null(prepare, Int32(index + 1))
                        } else {
                            // Unsupported type
                            sqlite3_finalize(prepare)
                            return nil
                        }
                    }
                }

                var rows = [[String: Any]]()

                while sqlite3_step(prepare) == SQLITE_ROW {
                    var row = [String: Any]()

                    for index in 0..<sqlite3_column_count(prepare) {
                        let name = String(cString: sqlite3_column_name(prepare, index))
                        let type = sqlite3_column_type(prepare, index)
                        let value: Any?

                        switch type {

                        case SQLITE_INTEGER:
                            value = Int(sqlite3_column_int(prepare, index))

                        case SQLITE_FLOAT:
                            value = Double(sqlite3_column_double(prepare, index))

                        case SQLITE_TEXT:
                            let cString = sqlite3_column_text(prepare, index)
                            value = String(cString: cString!)

                        case SQLITE_BLOB:
                            let data = sqlite3_column_blob(prepare, index)
                            let size = Int(sqlite3_column_bytes(prepare, index))
                            value = Data(bytes: data!, count: size)

                        case SQLITE_NULL:
                            value = nil

                        default:
                            // Unsupported type
                            sqlite3_finalize(prepare)
                            return nil
                        }
                        row[name] = value
                    }
                    rows.append(row)
                }
                if rows.isEmpty { return nil }
                results = rows
            }
            return results
        }

        func closeDatabase() {
            if sqlite3_close(dbPointer) != SQLITE_OK {
                print("Error closing database")
            }
        }
    
    
    
    
    
    
    
    
    //        func select(tableName: String, whereClause: String? = nil, args: [Any]? = nil, selectColumn: String = "*", joinsQuerry: String = "") -> [[String: Any]]? {
    //
    //            var results: [[String: Any]]?
    //            let query = "SELECT \(selectColumn) FROM \(tableName) \(joinsQuerry) \(whereClause != nil ? "WHERE \(whereClause!)" : "")"
    //            var prepare: OpaquePointer?
    //
    //            if sqlite3_prepare_v2(dbPointer, query, -1, &prepare, nil) == SQLITE_OK {
    //                if let args = args {
    //                    // Bind the parameters to the statement
    //                    for index in 0..<args.count {
    //                        if let value = args[index] as? String {
    //                            sqlite3_bind_text(prepare, Int32(index + 1), (value as NSString).utf8String, -1, nil)
    //                        } else if let value = args[index] as? Int {
    //                            sqlite3_bind_int(prepare, Int32(index + 1), Int32(value))
    //                        } else if let value = args[index] as? Double {
    //                            sqlite3_bind_double(prepare, Int32(index + 1), value)
    //                        } else if args[index] is NSNull {
    //                            sqlite3_bind_null(prepare, Int32(index + 1))
    //                        } else {
    //                            // Unsupported type
    //                            sqlite3_finalize(prepare)
    //                            return nil
    //                        }
    //                    }
    //                }
    //
    //                var rows = [[String: Any]]()
    //
    //                while sqlite3_step(prepare) == SQLITE_ROW {
    //                    var row = [String: Any]()
    //
    //                    for index in 0..<sqlite3_column_count(prepare) {
    //                        let name = String(cString: sqlite3_column_name(prepare, index))
    //                        let type = sqlite3_column_type(prepare, index)
    //                        let value: Any?
    //
    //                        switch type {
    //
    //                        case SQLITE_INTEGER:
    //                            value = Int(sqlite3_column_int(prepare, index))
    //
    //                        case SQLITE_FLOAT:
    //                            value = Double(sqlite3_column_double(prepare, index))
    //
    //                        case SQLITE_TEXT:
    //                            let cString = sqlite3_column_text(prepare, index)
    //                            value = String(cString: cString!)
    //
    //                        case SQLITE_BLOB:
    //                            let data = sqlite3_column_blob(prepare, index)
    //                            let size = Int(sqlite3_column_bytes(prepare, index))
    //                            value = Data(bytes: data!, count: size)
    //
    //                        case SQLITE_NULL:
    //                            value = nil
    //
    //                        default:
    //                            // Unsupported type
    //                            sqlite3_finalize(prepare)
    //                            return nil
    //                        }
    //                        row[name] = value
    //                    }
    //                    rows.append(row)
    //                }
    //                if rows.isEmpty { return nil }
    //                results = rows
    //            }
    //            return results
    //        }

        
}
