//
//  SecondViewController.swift
//  SegueTest
//
//  Created by Ruilin 😈 on 2/13/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var txtWelcome: UILabel!
    var welcomeStr=""
    override func viewDidLoad() {
        super.viewDidLoad()
        txtWelcome.text=welcomeStr
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
