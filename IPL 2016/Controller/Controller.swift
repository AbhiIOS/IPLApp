//
//  Controller.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/18/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class Controller: NSObject {
    
    
    var fetch:FetchLogo?
    var teamviewmodel : TeamViewModel?
    
    func fetchDataFromServices(withImagePath path:String) -> Void {
        
         fetch?.importTeamLogoFromStorage(withData: path)
        
    }
    
    func callToDatabase() -> Void {
         fetch = FetchLogo()
        fetch?.teamViewControl = self
        fetch?.searchTeamLogoInDatabase()
    }
    
    func receiveData(withData data:[Team]) -> Void {
        teamviewmodel?.receiveDataFromController(withControllerData: data)
    }
    
    func recieveTeamLogoImage(withImage image:UIImage) -> Void {
        teamviewmodel?.recieveTeamLogoImageFromController(withImage: image)
    }

}
