//
//  PlayerDetail.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/25/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class PlayerDetail: NSObject {
    
    var playerName1:String?
    var playerDob1:String?
    var playerNationality1:String?
    var playerBattingStyle1:String?
    var playerRole1:String?
    var playerBowlingStyle1:String?
    var playerImage:UIImage?
    
    init(PlayerName name:String, dob date:String, nationality data:String, BatStyle bs:String, BatRole role:String, bowlStyle bs2:String, PlayerImage image:UIImage) {
        
        self.playerName1 = name
        self.playerDob1 = date
        self.playerNationality1 = data
        self.playerRole1 = role
        self.playerBattingStyle1 = bs
        self.playerBowlingStyle1 = bs2
        self.playerImage = image
    }

}
