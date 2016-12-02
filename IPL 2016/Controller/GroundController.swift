//
//  GroundController.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/22/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class GroundController: NSObject, ControllerDelegate {
    var groundViewVAR = GroundViewModel()
    var groundFetchVAR:FetchGroundImage?
    
    var groundVWmodel:GroundViewModel?
    var delegate:ServicesDelegate?
    var delegate1:DataSenderDelegate?
    //var services = FetchGroundImage()
    
    func callFromControllerToServices() -> Void {
        groundFetchVAR = FetchGroundImage()
        groundFetchVAR?.delegate = self
        groundFetchVAR?.searchTeamGroundDetailsInDatabase()
    }
    
    func callForImageFromControllerToServices(GroundName grndImageName:String) -> Void {
        groundFetchVAR?.importTeamGroundImageFromStorage(withData: grndImageName)
    }
    
    func recieveDataFromServices(groundDetailArray:[Ground]) -> Void {
        //groundFetchVAR?.delegate = self
        delegate1?.recieveDataFromController(teamDetailArray: groundDetailArray)
    }
    
    func recieveGroundImageFromServices(groundImage image:UIImage) -> Void {
        delegate1?.recieveImageFromControllerToViewModel(TeamGroundIMAGE: image)
        
    }

}
