//
//  User.swift
//  StreetMusicVideo
//
//  Created by Henrique Velloso on 9/1/15.
//  Copyright © 2015 HenriqueVelloso. All rights reserved.
//

import UIKit
import Parse

class User: PFUser {

    //MARK: - Properties
    
    /*
    objectId : String
    username : String
    password : String
    emailVerified : Bool
    email : String
    createdAt : NSData
    updatedAt : NSData
    */
    
    @NSManaged var name: String?
    @NSManaged var photo: PFFile?
    

    
    @NSManaged var fullName: String?
    
    //MARK: - Events
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        
        }
    }
    
    //MARK: - Functions
    
    func signIn(username: String?, password: String?, callback: (success: Bool, error: NSError?) -> ()) {
        
        
        
        
        
        User.logInWithUsernameInBackground(username!, password: password!, block: { (user, error) -> Void in
            if(error == nil) {
                callback(success: true, error: nil)
            } else {
                callback(success: false, error: error)
                
            }
        })
        
        
        
        
        
        User.logInWithUsernameInBackground("ds", password: "ds") { user, error in
            
            if(error == nil) {
                callback(success: true, error: nil)
            } else {
                callback(success: false, error: error)
                
            }
            
        }
        
        self.signIn("", password: "") { success, error in
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    func resetPassword(email: String?, callback: (success: Bool, error: NSError?) -> ()) {
        User.requestPasswordResetForEmailInBackground(email!, block: { (success, error) -> Void in
            if(error == nil) {
                callback(success: true, error: nil)
            } else {
                callback(success: false, error: error)
            }
        })
    }
    
    func register(user: User?, callback: (success: Bool, error: NSError?) -> ()) {
        user?.signUpInBackgroundWithBlock({ (success, error) -> Void in
            if(error == nil) {
                callback(success: true, error: nil)
            } else {
                callback(success: false, error: error)
            }
        })
    }
    
    func verifyUsername(username: String?, callback: (success: Bool, error: NSError?) -> ()) {
        let userQuery = User.query()!
        
        userQuery.whereKey("username", equalTo: username!)
        
        userQuery.countObjectsInBackgroundWithBlock { (count, error) -> Void in
            if(count == 1) {
                callback(success: true, error: nil)
            } else {
                callback(success: false, error: error)
            }
        }
    }
    
}
