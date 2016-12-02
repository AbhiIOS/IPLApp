//
//  FetchPlayerDetails.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/25/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit
import Firebase

class FetchPlayerDetails: NSObject {
    
    var playerName:String?
    var playerDob:String?
    var playerNationality:String?
    var playerRole:String?
    var playerBattingStyle:String?
    var playerBowlingStyle:String?
    var playerImage:String?
    
    var playerDetailsArray:NSArray = []
    var delegate:playerDetails11?
    
    func importPlayerImageFromStorage(withData data1:String) -> Void {
        
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
                let playerDetail = PlayerDetail(PlayerName: self.playerName!, dob: self.playerDob!, nationality: self.playerNationality!, BatStyle: self.playerBattingStyle!, BatRole: self.playerRole!, bowlStyle: self.playerBowlingStyle!, PlayerImage: Image)
                self.delegate?.recievePlayerDataFromServices(PlayerDetail: playerDetail)
            }
        }
    }
    
    func searchPlayerDetailsInDatabase(withTeamName name:String, rowIndex:Int) -> Void {
        
        let ref = FIRDatabase.database().reference()
        ref.child("players").child(name).observeSingleEvent(of: .value, with: {(snapshot) in
            
            self.playerDetailsArray = snapshot.value as! NSArray
            let details = self.playerDetailsArray[rowIndex] as! NSDictionary
            self.playerName = details["player_name"] as! String?
            self.playerDob = details["player_dob"] as! String?
            self.playerNationality = details["player_nationality"] as! String?
            self.playerBattingStyle = details["player_batting_style"] as! String?
            self.playerRole = details["player_role"] as! String?
            self.playerBowlingStyle = details["player_bowling_style"] as! String?
            self.playerImage = details["player_img_url"] as! String?
            
            self.importPlayerImageFromStorage(withData: self.playerImage!)
        })
    }


}
