//
//  GroundViewModel.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/22/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class GroundViewModel: NSObject, DataSenderDelegate {
    
    let teamDetailsVAR = TeamDetailsViewController()
    
    
    var teamDetailsVaria:TeamDetailsViewController?
    var delegate:ControllerDelegate?
    var delegate1:assignArray?
    var groundDetailArray:[Ground] = []
    var groundImage:UIImage?
    var groundcontrolVAR:GroundController?
    var row:Int?
    
    func callFromViewModelToController() -> Void {
        groundcontrolVAR = GroundController()
        groundcontrolVAR?.groundVWmodel = self
        groundcontrolVAR?.delegate1 = self
        groundcontrolVAR?.callFromControllerToServices()
    }
    
    func recieveDataFromController(teamDetailArray:[Ground]) -> Void {
        
        
        if teamDetailArray.count == 8 {
            groundDetailArray = teamDetailArray
            //delegate1?.assignValues()
        }
        else
        {
            groundcontrolVAR?.callFromControllerToServices()
        }
        self.callForImageFromViewModelToController(rowNum: row!)
        
    }
    
    func callForImageFromViewModelToController(rowNum:Int) -> Void {
        let groundImageName = groundDetailArray[rowNum].GroundImageName
        groundcontrolVAR?.callForImageFromControllerToServices(GroundName: groundImageName!)
    }
    
    func recieveImageFromControllerToViewModel(TeamGroundIMAGE image:UIImage) -> Void {
        groundImage = image
        delegate1?.assignValues()
    }

}
