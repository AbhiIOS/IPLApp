//
//  Team.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/18/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class Team: NSObject {
    
    var teamLogo:String?
    var teamName:String?
    
    init(withteamImage image:String, withTeamName name:String) {
        self.teamLogo = image
        self.teamName = name
    }
    
}
