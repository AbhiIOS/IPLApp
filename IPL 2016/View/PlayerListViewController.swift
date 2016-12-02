//
//  PlayerListViewController.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/24/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit
import Firebase

class PlayerListViewController: UIViewController {
    
    @IBOutlet weak var playerListView: UITableView!
    
    var teamName:String?
    var rowIndex:Int?
    var playerListViewVARIA:PlayerListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = teamName
        playerListView.dataSource = self
        //playerListView.delegate = self
        playerListViewVARIA = PlayerListViewModel()
        playerListViewVARIA?.playerListViewControllerVAR = self
        playerListViewVARIA?.teamName2 = teamName
        playerListViewVARIA?.playerListCallFromViewModelToController(/*Teamname: teamName!*/)
        
        playerListView.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadData() -> Void {
        playerListView.reloadData()
        self.animateTable()
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
        var indexpath:IndexPath?
        indexpath = playerListView.indexPathForSelectedRow
        let playerDetailsVMvar = segue.destination as! PlayerDetailsViewController
        playerDetailsVMvar.rowIndex = indexpath?.row
        playerDetailsVMvar.teamName = self.teamName
    }
    
    func animateTable() {
        
        self.playerListView.reloadData()
        
        let cells = playerListView.visibleCells
        let tableHeight: CGFloat = playerListView.bounds.size.height
        
        for (index, cell) in cells.enumerated() {
            cell.transform = CGAffineTransform(translationX: -450, y: -(tableHeight))
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
        }
    }

    

}

extension PlayerListViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (playerListViewVARIA?.playerList.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerListCell", for: indexPath) as! PlayerListTableViewCell
        
        cell.playerName.text = playerListViewVARIA?.playerList[indexPath.row].playerName
        //cell.playerImage.image = playerListViewVARIA?.imageArray[indexPath.row]
        cell.backgroundColor = UIColor.clear
        return cell
    }
}

//extension PlayerListViewController: UITableViewDelegate
//{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "playerListCell", for: indexPath) as! PlayerListTableViewCell
//        
//        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
//        cell.playerName.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//        }, completion: { finished in
//            cell.playerName.transform = CGAffineTransform(scaleX: 1, y: 1)
//        })
//        cell.backgroundColor = UIColor.clear
//    }
//}
