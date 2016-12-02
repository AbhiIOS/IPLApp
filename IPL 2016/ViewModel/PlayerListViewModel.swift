//
//  PlayerListViewModel.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/24/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class PlayerListViewModel: NSObject, playerListArray12 {
    
    var playerListViewControllerVAR:PlayerListViewController?
    var playerListControllerVAR:PlayerListController?
    var playerList:[PlayerList] = []
    var imageArray:[UIImage] = []
    var teamName2:String?
    var i:Int = 0
    
    func playerListCallFromViewModelToController(/*Teamname teamName:String*/) -> Void {
        playerListControllerVAR = PlayerListController()
        playerListControllerVAR?.playerListViewModelVAR = self
        playerListControllerVAR?.delegate = self
        playerListControllerVAR?.playerListCallFromControllerToServices(TeamName: teamName2!)
    }
    
    func callForImageFromViewModelToController() -> Void {
        let imageName = playerList[i].playerImgName
        playerListControllerVAR?.callForImageFromControllerToServices(PlayerImage: imageName!)
        i+=1
    }
    
    func receievePlayerListFromController(PlayerNamesArray array:[PlayerList]) -> Void {
        playerList = array
        if playerList.count == 0 {
            playerListControllerVAR?.playerListCallFromControllerToServices(TeamName: teamName2!)
        }
        else
        {
            //self.callForImageFromViewModelToController()
            playerListViewControllerVAR?.reloadData()
        }
    }
    
    func receiveImageFromController(PlayerImage image14:UIImage) -> Void {
        imageArray.append(image14)
        if (imageArray.count)<(playerList.count) {
            self.callForImageFromViewModelToController()
        }
        
        if imageArray.count == playerList.count {
            playerListViewControllerVAR?.reloadData()
        }
    }
}
