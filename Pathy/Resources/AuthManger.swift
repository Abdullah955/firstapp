//
//  AuthManger.swift
//  Pathy
//
//  Created by Abdullah Alatter on 14/01/2021.
//

import FirebaseAuth


public class AuthManger{
    
    static let shared = AuthManger()
    
    
    public func regestirNewUser(username:String,  email:String, password:String, complation: @escaping (Bool) -> Void){
        
        /*
         - Check if username is avilabile
         - Check if email is avilablile
         - create account
         - insert account to Database
         */
        DatabaseManger.shared.canCreatenNewUsername(with: email, username: username){ canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil , result != nil else{
                        // Firebase auth could not create account.
                        complation(false)
                        return
                    }
                    // insert into Database
                    DatabaseManger.shared.insertNewUser(with: email, username: username){ inserted in
                        if inserted{
                            // User inserted.
                            complation(true)
                            return
                        }
                        else {
                            // Faild to insert
                            complation(false)
                            return
                        }
                        
                    }
                }
            }
            else {
                // username or email dose not exist.
                complation(false)
                
            }
            
            
        }
        
    }
    
    
    // Creating login from Firebase connection
    public func loginUser(username:String?,  email:String?, password:String, completion: @escaping (Bool) -> Void) {
        if let email = email{
            Auth.auth().signIn(withEmail: email, password: password){ authResult , error in
                guard authResult != nil , error == nil else {
                    completion(false)
                    print("HERE1")
                    return
                }
                    completion(true)
                print("HERE2")
            }
        }
        else if let username = username {
            print(username)
            print("!!!!")
        }
    }
}
