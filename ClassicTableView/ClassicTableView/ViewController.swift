//
//  ViewController.swift
//  ClassicTableView
//
//  Created by Ruilin 😈 on 2/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    let arr=["Alex","Peter","Tom","Alex","Peter","Alex","Peter","Tom","Alex","Peter","Alex","Peter","Tom","Alex","Peter"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=arr[indexPath.row]
        return cell;
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view.
    }


}

