//
//  PlayerDetailsController.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/25/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class PlayerDetailsController: NSObject, playerDetails11 {
    
    var fetchPlayerDetailVAR:FetchPlayerDetails?
    var delegate:playerDetails12?
    
    func playerDetailsCallFromControllerToServices(TeamName name:String, rowIndex:Int) -> Void {
        fetchPlayerDetailVAR = FetchPlayerDetails()
        fetchPlayerDetailVAR?.delegate = self
        fetchPlayerDetailVAR?.searchPlayerDetailsInDatabase(withTeamName: name, rowIndex: rowIndex)
    }
    
    func recievePlayerDataFromServices(PlayerDetail details:PlayerDetail) -> Void {
        delegate?.recievePlayerDataFromController(PlayerDetail: details)
    }

}
