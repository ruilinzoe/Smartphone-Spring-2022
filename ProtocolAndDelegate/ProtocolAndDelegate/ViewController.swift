//
//  ViewController.swift
//  ProtocolAndDelegate
//
//  Created by Ruilin 😈 on 2/22/22.
//

import UIKit

class ViewController: UIViewController, SendFirstAndLastNameDelegate {
   
    
    

    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblWelcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getName(_ sender: Any) {
        performSegue(withIdentifier: "segueGetName", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="segueGetName"{
            let getNameVC=segue.destination as! GetNameViewController
            guard let first=lblFirstName.text else{return}
            guard let last=lblLastName.text else{return}
            getNameVC.firstName=first
            getNameVC.lastName=last
            
            getNameVC.sendFirstAndLastNameDelegate=self
        }
    }
    
    func sendFirstAndLastName(firstName: String, lastName: String) {
        lblFirstName.text=firstName
        lblLastName.text=lastName
    }
    func setWelcomeTxt(welcomeTxt: String) {
        lblWelcome.text=welcomeTxt
    }
    
    
}

