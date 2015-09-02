//
//  PFRelation.swift
//  StreetMusicVideo
//
//  Created by Henrique Velloso on 9/2/15.
//  Copyright © 2015 HenriqueVelloso. All rights reserved.
//

import Foundation
import Parse

public extension PFRelation {
    
    public var objects : [AnyObject]? {
        
        get { return self.objects }
        set { self.objects = newValue }
        
    }
    
    
    func loadObjects() {
        
        self.query()!.findObjectsInBackgroundWithBlock {(objects: [AnyObject]?, error: NSError?) -> Void in
            if let error = error {
                print(error)
            } else {
                self.objects = objects!
            }
        }
    }
    
    func addObjects(objects: [AnyObject]) {
        
        for item in objects {
            
            self.addObject(item as! PFObject)
        }
        
    }
    
    func removeObjects(objects: [AnyObject]) {
        
        for item in objects {
            
            self.removeObject(item as! PFObject)
        }
        
    }
    
}

