//
//  AuthManger.swift
//  Pathy
//
//  Created by Abdullah Alatter on 14/01/2021.
//

import FirebaseAuth


public class AuthManger{
    
    static let shared = AuthManger()
    
    
    public func regestirNewUser(username:String,  email:String, password:String){
        
    }
    
    
    // Creating login from Firebase connection
    public func loginUser(username:String?,  email:String?, password:String, completion: (Bool -> Void)) {
        if let email = email{
            Auth.auth().signIn(withEmail: email, password: password){ authResult , error in
                guard authResult != nil , error == nil else {
                    completion(false)
                    return
                }
                    completion(true)
            }
            
        }
        else if let username = username {
            print(username)
        }
    }
}
