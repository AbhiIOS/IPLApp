//
//  FetchLogo.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/17/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import CoreData

class FetchLogo: NSObject {
    
    var image:UIImage?
    var image1:UIImage?
    var imageArray1:NSArray?
    var ref : FIRDatabaseReference!
    var teamViewModel:TeamViewModel?
    var teamViewControl:Controller?
    var teamArray:[Team] = []
    var teamImagesArray:[TeamLogos] = []
    var i:Int = 0
    
    func importTeamLogoFromStorage(withData data1:String) -> Void {
        
        //let teamController = Controller()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do
        {
           try teamImagesArray = context.fetch(TeamLogos.fetchRequest())
        }catch
        {
           print("Error")
        }
        
        if teamImagesArray.count == teamArray.count {
            
                let tmImage:UIImage! = UIImage(data: teamImagesArray[i].images as! Data)
                i+=1
                teamViewControl?.recieveTeamLogoImage(withImage: tmImage)
            
        }
        else{
            //Creating a reference of storage Services
            let storage = FIRStorage.storage()
            let storageRef = storage.reference(forURL: "gs://ipl-2016-91751.appspot.com")
            
            let logo = storageRef.child(data1)
            
            // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
            logo.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
                if (error != nil) {
                    // Uh-oh, an error occurred!
                    print(1)
                } else {
                    // Data for "images/island.jpg" is returned
                    // ... let islandImage: UIImage! = UIImage(data: data!)
                    let teamLabel:UIImage! = UIImage(data:data!)
                    self.saveImagesToCoreData(ImageData: data!)
                    self.teamViewControl?.recieveTeamLogoImage(withImage: teamLabel)
                }
            }
        }
        
        }
    
    func searchTeamLogoInDatabase() -> Void {
        
        //let control2 = Controller()
        ref = FIRDatabase.database().reference()
        ref.child("teams").observeSingleEvent(of: .value, with: {(snapshot) in
            
            self.imageArray1 = snapshot.value as? NSArray
           // let teamDetail = imageArray?[rowindex] as! NSDictionary
            for data in self.imageArray1!
            {
                let k = data as! NSDictionary
                let teamImage = k["team_img_url"] as! String
                let teamName = k["team_name"] as! String
                let team = Team(withteamImage: teamImage, withTeamName: teamName)
                self.teamArray.append(team)
            }
            
            print(self.teamArray.count)
            self.teamViewControl?.receiveData(withData: self.teamArray)
    })
     
}
    
    func saveImagesToCoreData(ImageData data:Data) -> Void {
     let context1 = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let binImageData = TeamLogos(context: context1)
        binImageData.images = data as NSData?
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    
    }
