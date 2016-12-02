//
//  UserAutheticationViewController.swift
//  IPL 2016
//
//  Created by BridgeLabz Solutions LLP  on 11/21/16.
//  Copyright © 2016 BridgeLabz Solutions LLP . All rights reserved.
//

import UIKit
import FirebaseAuth

class UserAutheticationViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var signUpLabel: UIButton!
    @IBOutlet weak var signInLabel: UIButton!
    
    @IBOutlet weak var allignedEmailTextField: NSLayoutConstraint!
    @IBOutlet weak var allignedPasswordTextField: NSLayoutConstraint!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLabel.isHidden = true
//        let user1 = FIRAuth.auth()?.currentUser
//        self.signedIn(user1)
        //self.view.backgroundColor = UIColor.darkGray
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.allignedEmailTextField.constant -= self.view.bounds.width
        self.allignedPasswordTextField.constant += self.view.bounds.width
        self.signUpLabel.alpha = 0
        self.signInLabel.alpha = 0
        
            }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.0, delay: 0.10, options: .curveEaseOut, animations: {
            self.allignedEmailTextField.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.20, options: .curveEaseOut, animations: {
            self.allignedPasswordTextField.constant -= self.view.bounds.width
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
        self.signUpLabel.alpha = 1
        self.signInLabel.alpha = 1

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signUpBtnPressed(_ sender: Any) {
        let email = emailTextField.text
        let pswd = passwordTextField.text
        FIRAuth.auth()?.createUser(withEmail: email!, password: pswd!, completion: {
            (user, error) in
            if let error = error {
                
                let alertView = UIAlertController.init(title: "ERROR", message: "Seems like you already have created account !!!!!!", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
                alertView.addAction(action)
                self.present(alertView, animated: true, completion:nil)
                print(error.localizedDescription)
                return
            }
            self.activityIndicator.startAnimating()
            self.loadLabel.isHidden = false
            self.signedIn(user)
        })
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        
        self.activityIndicator.startAnimating()
        self.loadLabel.isHidden = false
        let email = emailTextField.text
        let pswd = passwordTextField.text
        
        if (email?.isEmpty)! || (pswd?.isEmpty)! {
            
            let alertView = UIAlertController.init(title: "YOU MISSED SOMETHING !!!!!", message: "Plesae Enter Email & Password !!!!!", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
            alertView.addAction(action)
            self.present(alertView, animated: true, completion:nil)
            self.activityIndicator.stopAnimating()
            self.loadLabel.isHidden = true
            return
        }
        
        FIRAuth.auth()?.signIn(withEmail: email!, password: pswd!, completion: {(user, error) in
            if let error = error {
                self.activityIndicator.stopAnimating()
                self.loadLabel.isHidden = true
                
                let alertView = UIAlertController.init(title: "INVALID USER !!!!!", message: "Please SignUp First !!!!!", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
                alertView.addAction(action)
                self.present(alertView, animated: true, completion:nil)
                print(error.localizedDescription)
                return
            }
            
            self.signedIn(user)
            self.emailTextField.text = ""
            self.passwordTextField.text = ""
        })
    }
    
    func signedIn(_ user: FIRUser?) {
        
        performSegue(withIdentifier: "goToCollectionView", sender: nil)
        activityIndicator.stopAnimating()
        loadLabel.isHidden = true
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
