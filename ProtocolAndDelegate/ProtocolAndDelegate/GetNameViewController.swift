//
//  GetNameViewController.swift
//  ProtocolAndDelegate
//
//  Created by Ruilin 😈 on 2/22/22.
//

import UIKit
protocol SendFirstAndLastNameDelegate{
    func sendFirstAndLastName(firstName: String, lastName: String)
    func setWelcomeTxt(welcomeTxt: String)
}

class GetNameViewController: UIViewController {

    var firstName: String?
    var lastName: String?
    var sendFirstAndLastNameDelegate: SendFirstAndLastNameDelegate?
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let first=firstName else{
            return
        }
        guard let last=lastName else{
            return
        }
        
        txtLastName.text=last
        txtFirstName.text=first
        

        // Do any additional setup after loading the view.
    }
    
  

    @IBAction func saveName(_ sender: Any) {
        guard let firstName = txtFirstName.text else {
            return
        }
        guard let lastName = txtLastName.text else {
            return
        }

        sendFirstAndLastNameDelegate?.sendFirstAndLastName(firstName: firstName, lastName: lastName)
        sendFirstAndLastNameDelegate?.setWelcomeTxt(welcomeTxt: "Welcome \(firstName), \(lastName)" )
        self.navigationController?.popViewController(animated: true)
    }
    
}
