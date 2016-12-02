//
//  Protocols.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/23/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import Foundation
import UIKit

protocol DataSenderDelegate: class {
    
//    func callFromViewModelToController()
//    func callForImageFromViewModelToController(rowNum:Int)
    func recieveDataFromController(teamDetailArray:[Ground])
    func recieveImageFromControllerToViewModel(TeamGroundIMAGE image:UIImage)
}

protocol ControllerDelegate {
//    func callFromControllerToServices()
//    func callForImageFromControllerToServices(GroundName grndImageName:String)
    func recieveDataFromServices(groundDetailArray:[Ground])
    func recieveGroundImageFromServices(groundImage image:UIImage)
    
}

protocol ServicesDelegate {
    
     func searchTeamGroundDetailsInDatabase()
    func importTeamGroundImageFromStorage(withData data1:String)
}

protocol assignArray {
    func assignValues()
}

protocol playerListArrayDelegate {
    func playerListCallFromControllerToServices(TeamName team:String)
    func callForImageFromControllerToServices(PlayerImage image:String)
    func recieveImageFromStorage(PlayerImage image1:UIImage)
    func recievePlayerListFromServices(PlayerListARRAY array:[PlayerList])
}

protocol playerListArray12 {
    func playerListCallFromViewModelToController(/*Teamname teamName:String*/)
    func callForImageFromViewModelToController()
    func receievePlayerListFromController(PlayerNamesArray array:[PlayerList])
    func receiveImageFromController(PlayerImage Image14:UIImage)
}

protocol playerDetails11 {
    func recievePlayerDataFromServices(PlayerDetail details:PlayerDetail)
}

protocol playerDetails12 {
    func recievePlayerDataFromController(PlayerDetail details:PlayerDetail)
}

protocol playerDetails13 {
    func displayPlayersDetails(PlayerDetail details:PlayerDetail)
}

    

    

    
    
    

