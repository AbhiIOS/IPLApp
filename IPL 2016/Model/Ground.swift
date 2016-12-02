//
//  Ground.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/22/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class Ground: NSObject {
    
    var teamName:String?
    var teamCaptain:String?
    var teamCoach:String?
    var teamOwner:String?
    var teamVenue:String?
    var GroundImageName:String?
    
    init(teamName name:String, captain capName:String, coach cochName:String, Owner ownrName:String, venue grndName:String, groundImage image:String) {
        
        self.teamName = name
        self.teamCaptain = capName
        self.teamCoach = cochName
        self.teamOwner = ownrName
        self.teamVenue = grndName
        self.GroundImageName = image
    }

}
