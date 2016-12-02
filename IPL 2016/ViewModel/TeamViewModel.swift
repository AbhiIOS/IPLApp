//
//  TeamViewModel.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/18/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class TeamViewModel: NSObject {
    
    let controller = Controller()
    var viewControl: ViewController?
    var fetchTeamLogo:FetchLogo?
    var num:Int = 0
    var imageX:[UIImage] = []
    var imageURLarray:[Team] = []
    var NumberOfRows:Int = 0
    var arrayIndex:Int = 0
    
    func importDataFromController(withImage name:String) -> Void {
        controller.fetchDataFromServices(withImagePath: name)
        
    }
    
    func callFromViewModelToController() -> Void {
        controller.teamviewmodel=self
        controller.callToDatabase()
    }
    
//    func fetchNumberOfRowsInSection() -> Void {
//        let fetchRowsNum = FetchLogo()
//        fetchRowsNum.teamViewModel = self
//        if num==0 {
//             fetchRowsNum.NumberOfRows()
//        }
//        //return num
//    }
    
//    func acceptInteger(withIntNum number:Int) -> Void {
//        num = number
//        print(num)
//        //viewControl?.reloadData()
//    }
    
    func receiveDataFromController(withControllerData data:[Team]) -> Void {
        imageURLarray = data
        if imageURLarray.count == 0
        {
            controller.callToDatabase()
        }
        else
        {
            NumberOfRows = (imageURLarray.count)
        }
        self.importImage()
        //viewControl?.reloadData()
    }
    
    func extractImageURL(withIndex data:Int) -> String {
        let dataXQ:String = imageURLarray[data].teamLogo!
        return dataXQ
    }
    
    func recieveTeamLogoImageFromController(withImage image:UIImage) -> Void {
        imageX.append(image)
        if imageX.count<imageURLarray.count {
            self.importImage()
        }
        print(imageX.count)
        if imageX.count==imageURLarray.count {
            viewControl?.reloadData()
        }
        
    }
    
    func importImage() -> Void {
        let stringData = imageURLarray[arrayIndex].teamLogo
        arrayIndex+=1
        controller.fetchDataFromServices(withImagePath: stringData!)
        
            }

}
