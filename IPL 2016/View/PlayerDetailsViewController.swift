//
//  PlayerDetailsViewController.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/25/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UIViewController, playerDetails13 {

    @IBOutlet weak var PlyrImageLabel: UIImageView!
    
    @IBOutlet weak var plyrNameLabel: UILabel!
    @IBOutlet weak var dobLABEL: UILabel!
    @IBOutlet weak var nationalityLABEL: UILabel!
    @IBOutlet weak var plyrRoleLabel: UILabel!
    @IBOutlet weak var battingStyleLabel: UILabel!
    @IBOutlet weak var bowlingStyleLabel: UILabel!
    
    @IBOutlet weak var activityIndicator1: UIActivityIndicatorView!
    var playerDetailsVMVAR:PlayerDetailsViewModel?
    var rowIndex:Int?
    var teamName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator1.startAnimating()
        playerDetailsVMVAR = PlayerDetailsViewModel()
        playerDetailsVMVAR?.delegate = self
        playerDetailsVMVAR?.playerDetailCallFromVMTOController(TeamName: teamName!, rowindex: rowIndex!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayPlayersDetails(PlayerDetail details:PlayerDetail) -> Void {
        
        plyrNameLabel.text = details.playerName1
        dobLABEL.text = details.playerDob1
        nationalityLABEL.text = details.playerNationality1
        plyrRoleLabel.text = details.playerRole1
        battingStyleLabel.text = details.playerBattingStyle1
        bowlingStyleLabel.text = details.playerBowlingStyle1
        PlyrImageLabel.image = details.playerImage
        activityIndicator1.stopAnimating()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
