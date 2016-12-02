//
//  FetchGroundImage.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/22/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class FetchGroundImage: NSObject, ServicesDelegate {
    var teamDetailArray:NSArray? = []
    var groundArray:[Ground] = []
    var delegate:ControllerDelegate?
    var grndControllerTYP:GroundController?
    var groundControlXYZ = GroundController()
    
    func importTeamGroundImageFromStorage(withData data1:String) -> Void {
        
        //let teamController = Controller()
        
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
                let Image:UIImage! = UIImage(data:data!)
                self.delegate?.recieveGroundImageFromServices(groundImage: Image)
            }
        }
    }
    
    func searchTeamGroundDetailsInDatabase() -> Void {
        groundControlXYZ.delegate = self
        //let control2 = Controller()
        let ref = FIRDatabase.database().reference()
        ref.child("grounds").observeSingleEvent(of: .value, with: {(snapshot) in
            
           self.teamDetailArray = snapshot.value as? NSArray
            for ary in self.teamDetailArray!
            {
               let teamVar = ary as! NSDictionary
               let teamName = teamVar["team_name"] as! String?
               let teamCaptain = teamVar["team_captain"] as! String?
               let teamCoach = teamVar["team_coach"] as! String?
               let teamOwner = teamVar["team_owner"] as! String?
               let grndImageName = teamVar["team_ground"] as! String?
               let teamVenue = teamVar["team_home_venue"] as! String?
                
               let groundXZ = Ground(teamName: teamName!, captain: teamCaptain!, coach: teamCoach!, Owner: teamOwner!, venue: teamVenue!, groundImage: grndImageName!)
                self.groundArray.append(groundXZ)
            }
            print("**************",self.groundArray.count)
            self.delegate?.recieveDataFromServices(groundDetailArray: self.groundArray)
                    })
        
    }


}
