//
//  DatabaseManager.swift
//  Pathy
//
//  Created by Abdullah Alatter on 14/01/2021.
//

import FirebaseDatabase



public class DatabaseManger{
    
    static let shared = DatabaseManger()
    private let database = Database.database().reference()
    
    public func canCreatenNewUsername(with email: String, username:String, completion: (Bool) -> Void ){
        completion(true)
    }
    
    public func insertNewUser(with email:String, username:String,complitaion: @escaping (Bool) -> Void ){
        
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
                                    if error == nil{
                                       //succeeded
                                        complitaion(true)
                                        return
                                        
                                    }
                                       else{
                                        //faild
                                        complitaion(false)
                                       return
                                       }
                                       
                                       }
    }

}

