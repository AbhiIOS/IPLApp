//
//  PlayerDetailsViewModel.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/25/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class PlayerDetailsViewModel: NSObject, playerDetails12 {
    
    var playerDetailControllerVAR:PlayerDetailsController?
    var playerDetailXZ:PlayerDetail?
    var delegate:playerDetails13?
    
    func playerDetailCallFromVMTOController(TeamName name:String, rowindex:Int) -> Void {
        playerDetailControllerVAR = PlayerDetailsController()
        playerDetailControllerVAR?.delegate = self
        playerDetailControllerVAR?.playerDetailsCallFromControllerToServices(TeamName: name, rowIndex: rowindex)
    }
    
    func recievePlayerDataFromController(PlayerDetail details:PlayerDetail) -> Void {
        playerDetailXZ = details
        delegate?.displayPlayersDetails(PlayerDetail: details)
    }

}
