//
//  TeamDetailsViewController.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/22/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit
import Firebase

class TeamDetailsViewController: UIViewController, assignArray {

    @IBOutlet weak var teamGroundImage: UIImageView!
    
    @IBOutlet weak var teamGroundName: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamCaptainLabel: UILabel!
    @IBOutlet weak var teamCoachLabel: UILabel!
    @IBOutlet weak var teamOwnerLabel: UILabel!
    @IBOutlet weak var playerListBtn: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var rowIndex:Int?
    var teamName:String?
    var groundViewModelVAR:GroundViewModel?
    
    //var groundViewOBJ = GroundViewModel()
    var delegate:DataSenderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        playerListBtn.isEnabled = false
        groundViewModelVAR = GroundViewModel()
        groundViewModelVAR?.delegate1 = self
        groundViewModelVAR?.row = rowIndex
        groundViewModelVAR?.callFromViewModelToController()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    func assignValues() -> Void {
        teamGroundImage.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        teamCaptainLabel.transform = CGAffineTransform(translationX: 350, y: 0)
        teamCoachLabel.transform = CGAffineTransform(translationX: 350, y: 0)
        teamOwnerLabel.transform = CGAffineTransform(translationX: 350, y: 0)
        teamNameLabel.transform = CGAffineTransform(translationX: 350, y: 0)
        
        let teamname = groundViewModelVAR?.groundDetailArray[rowIndex!]
        
        teamNameLabel.text = teamname?.teamName
        UIView.animate(withDuration: 0.5, delay: 0.20, options: .curveEaseOut, animations: {
            self.teamNameLabel.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        
        teamGroundImage.image = groundViewModelVAR?.groundImage
        UIView.animate(withDuration: 1, animations: {
            self.teamGroundImage.layer.transform = CATransform3DMakeScale(1.05, 1.05, 1)
        },completion:{ finished in
            UIView.animate(withDuration: 0.1, animations: {
                self.teamGroundImage.layer.transform = CATransform3DMakeScale(1, 1, 1)
            })
        })
        
        teamGroundName.text = teamname?.teamVenue
        
        teamCaptainLabel.text = teamname?.teamCaptain
        UIView.animate(withDuration: 0.5, delay: 0.30, options: .curveEaseOut, animations: {
            self.teamCaptainLabel.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        
        teamCoachLabel.text = teamname?.teamCoach
        UIView.animate(withDuration: 0.5, delay: 0.40, options: .curveEaseOut, animations: {
            self.teamCoachLabel.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        
        teamOwnerLabel.text = teamname?.teamOwner
        UIView.animate(withDuration: 0.5, delay: 0.50, options: .curveEaseOut, animations: {
            self.teamOwnerLabel.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        
        activityIndicator.stopAnimating()
        playerListBtn.isEnabled = true

    }
    
    @IBAction func didSignOutBtnPressed(_ sender: Any) {
        do {
        try FIRAuth.auth()?.signOut()
        self.navigationController?.popToRootViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    } catch let signOutError as NSError {
        print ("Error signing out: \(signOutError.localizedDescription)")
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let ground = groundViewModelVAR?.groundDetailArray[rowIndex!]
        teamName = ground?.teamName
        let playerListViewContrller = segue.destination as! PlayerListViewController
        playerListViewContrller.teamName = self.teamName
        playerListViewContrller.rowIndex = self.rowIndex
        
    }
    

}
