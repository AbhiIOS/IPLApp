//
//  FetchPlayerList.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/24/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit
import Firebase

class FetchPlayerList: NSObject {
    
    var playerListArray:NSArray?
    var delegate:playerListArrayDelegate?
    var playerModel:[PlayerList] = []
    
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
                self.delegate?.recieveImageFromStorage(PlayerImage: Image)
            }
        }
    }

    func searchTeamGroundDetailsInDatabase(withTeamName name:String) -> Void {
        
        let ref = FIRDatabase.database().reference()
        ref.child("players").child(name).observeSingleEvent(of: .value, with: {(snapshot) in
            
            self.playerListArray = snapshot.value as? NSArray
            for ary in self.playerListArray!
            {
                let teamVar = ary as! NSDictionary
                let playerName = teamVar["player_name"] as! String?
                let playerImageName = teamVar["player_img_url"] as! String?
                let playerList12 = PlayerList(PlayerName: playerName!, ImageName: playerImageName!)
                self.playerModel.append(playerList12)
            }
            print(self.playerModel.count)
            self.delegate?.recievePlayerListFromServices(PlayerListARRAY: self.playerModel)
        })
    }
    
}
