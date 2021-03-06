//
//  Comment.swift
//  StreetMusicVideo
//
//  Created by Henrique Velloso on 9/1/15.
//  Copyright © 2015 HenriqueVelloso. All rights reserved.
//

import UIKit
import Parse

class Comment: PFObject, PFSubclassing {

    //MARK: - Properties
    
    /*
    objectId : String
    createdAt : NSData
    updatedAt : NSData
    */
    
    //@NSManaged var user: User?
    
    
    //MARK: - Events
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Comment"
    }
    
    //MARK: - Functions
    
}
