//
//  Post.swift
//  StreetMusicVideo
//
//  Created by Henrique Velloso on 9/1/15.
//  Copyright © 2015 HenriqueVelloso. All rights reserved.
//

import UIKit
import Parse

class Post: PFObject, PFSubclassing {
    
 //MARK: - Properties
    
    /*
    objectId : String
    createdAt : NSData
    updatedAt : NSData
    */
    
    @NSManaged var user: User?
    @NSManaged var video: Video?
    @NSManaged var location: PFGeoPoint?
    @NSManaged var descriptionText: String?
    @NSManaged var likes: PFRelation?
    @NSManaged var comments:  PFRelation?

    
    
    
    //MARK: - Events
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
        
    }
    
    
    override init() {
        super.init()
        
        self.comments = self.relationForKey("comments")
        self.likes = self.relationForKey("likes")
        
    }    
    
    static func parseClassName() -> String {
        return "Post"
    }
    
    //MARK: - Functions
    
    
    
    
}
