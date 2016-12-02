//
//  PlayerList.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/24/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class PlayerList: NSObject {
    
    var playerName:String?
    var playerImgName:String?
    
    init(PlayerName playerName:String, ImageName imageName:String) {
        self.playerName = playerName
        self.playerImgName = imageName
    }

}
