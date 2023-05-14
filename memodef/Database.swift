//
//  Database.swift
//  memodef
//
//  Created by 小野拓人 on 2023/05/14.
//

import Foundation
import SQLite3

class Database {
    
    var db: OpaquePointer?
    
    let dbfile: String = "sample.db"
    
    func openDB() {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.dbfile)
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("DBファイルが見つからず、生成もできません。")
        } else {
            print("DBファイルが生成できました。（対象のパスにDBファイルが存在しました。）")
        }
    }
    
    func createTable() {
        let createTable = "CREATE TABLE sampleTable (name TEXT, age INTEGER)"
        if sqlite3_exec(db, createTable, nil, nil, nil) != SQLITE_OK {
            print("テーブルの作成に失敗しました。")
        } else {
            print("テーブルが作成されました。")
        }
    }
    
    func insert() {
        var stmt: OpaquePointer?
        
        let queryString = "INSERT INTO sampleTable (name, age) VALUES ('aaa', 12)"
        
        // クエリを準備する
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        // クエリを実行する
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }
        
        print("データが登録されました")
    }
    
    func select(){
        let queryString = "SELECT * FROM sampleTable"
        
        var stmt:OpaquePointer?
        
        // クエリを準備する
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        // クエリを実行し、取得したレコードをループする
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let name = String(cString: sqlite3_column_text(stmt, 0))
            let age = sqlite3_column_int(stmt, 1)
            
            print("name : \(name)")
            print("age : \(age)")
        }
    }
    
    func update() {
        var stmt: OpaquePointer?
        
        let queryString = "UPDATE sampleTable SET age = 99 WHERE name = 'ccc'"
        
        // クエリを準備する
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        // クエリを実行する
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }
        
        print("データが更新されました")
    }
    
    func delete() {
        var stmt: OpaquePointer?
        
        let queryString = "DELETE FROM sampleTable WHERE name = 'aaa'"
        
        // クエリを準備する
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        // クエリを実行する
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }
        
        print("データが削除されました")
    }
}
