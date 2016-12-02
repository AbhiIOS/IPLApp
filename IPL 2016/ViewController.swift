//
//  ViewController.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/17/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var teamLogoCollection: UICollectionView!
    let teamViewModel = TeamViewModel()
    var teamLogo:UIImage?
    var teamView:TeamViewModel?
    var rowCount:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        teamViewModel.callFromViewModelToController()
        teamLogoCollection.dataSource = self
        teamLogoCollection.delegate = self
        teamViewModel.viewControl = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reloadData() -> Void {
        teamLogoCollection.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var indexpath:IndexPath?
        indexpath = teamLogoCollection.indexPathsForSelectedItems![0]
        let teamDetailView = segue.destination as! TeamDetailsViewController
        let indexOfCell = indexpath?.row
        teamDetailView.rowIndex = indexOfCell
        
    }
    
    @IBAction func signOutBtnPressed(_ sender: UIBarButtonItem) {
        do {
            try FIRAuth.auth()?.signOut()
            self.navigationController?.popToRootViewController(animated: true)
            //self.dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
        }
    }

}

extension ViewController: UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //let teamViewsXZ = TeamViewModel()
        
        return teamViewModel.NumberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerViewVar:HeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerViewCell", for: indexPath) as! HeaderView
        
        //headerViewVar. = UIColor.black
        headerViewVar.headerViewLabel.textColor = UIColor.white
        return headerViewVar
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamLogoCell", for: indexPath) as! TeamLogoCollectionViewCell
        
       // let imageName = teamViewModel.extractImageURL(withIndex: indexPath.row)
        
        //teamViewModel.importDataFromController(withImage: imageName)
//        let name:String = teamViewModel.imageURLarray[0].teamName!
//        print(name)
        cell.teamLogoLabel.image = teamViewModel.imageX[indexPath.row]
        return cell
    }
    
}

extension ViewController:UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        
//        UIView.animate(withDuration: 1.5)
//        {
//            cell.alpha = 1
//            cell.layer.transform = CATransform3DIdentity
//        }
    
        UIView.animate(withDuration: 1.3, delay: 0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }, completion: nil)
    }
        }

