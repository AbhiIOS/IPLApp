//
//  PlayerListController.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/24/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class PlayerListController: NSObject, playerListArrayDelegate {
    
    var playerListViewModelVAR:PlayerListViewModel?
    var fetchPlayerListVAR:FetchPlayerList?
    var delegate:playerListArray12?
    
    func playerListCallFromControllerToServices(TeamName team:String) -> Void {
        fetchPlayerListVAR = FetchPlayerList()
        fetchPlayerListVAR?.delegate = self
        fetchPlayerListVAR?.searchTeamGroundDetailsInDatabase(withTeamName: team)
    }
    
    func callForImageFromControllerToServices(PlayerImage image:String) -> Void {
        fetchPlayerListVAR?.importTeamGroundImageFromStorage(withData: image)
    }
    
    func recievePlayerListFromServices(PlayerListARRAY array:[PlayerList]) -> Void {
        delegate?.receievePlayerListFromController(PlayerNamesArray: array)
    }
    
    func recieveImageFromStorage(PlayerImage image1:UIImage) -> Void {
        delegate?.receiveImageFromController(PlayerImage: image1)
    }

}
