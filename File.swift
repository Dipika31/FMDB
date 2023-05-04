//
//  File.swift
//  FMDB
//
//  Created by Choudhary Dipika on 04/04/23.
//

import Foundation

struct Model
{
    var id : Int
    var name : String
}

class fmdbHelper
{
    static var file : FMDatabase!
    
    static func createFile()
    {
        var x = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        x.appendPathComponent("My FMDB File.db")
        file = FMDatabase(url: x)
        file.open()
        print(x.path)
        createTable()
    }
    
    static func createTable()
    {
        let query = "Create Table if not exists Students (id integer,name text)"
        try? file.executeUpdate(query, values: nil)
        print("Table created")
    }
    
    static func addData(id:Int,name:String)
    {
        let query = "insert into Students values (\(id),'\(name)')"
        try? file.executeUpdate(query, values: [id,name])
        print("Data Added")
    }
    
    static func getData() -> [Model]
    {
        var arr = [Model]()
        let query = "select * from Students"
        if let data = try? file.executeQuery(query, values: nil)
        {
            while data.next()
            {
                let name = data.object(forColumn: "name") as? String ?? ""
                let id = data.object(forColumn: "id") as? Int ?? 0
                let obj = Model(id: id, name: name)
                arr.append(obj)
            }
        }
        return arr
    }
    
    static func deleteData(id:Int,name:String)
    {
        let query = "DELETE FROM Students WHERE id = \(id)"
        try? file.executeUpdate(query, values: nil)
        print("Data Deleted")
    }
}
