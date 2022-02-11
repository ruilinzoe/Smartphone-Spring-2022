//
//  TableViewController.swift
//  TableViewController
//
//  Created by Ruilin 😈 on 2/10/22.
//

import UIKit

class TableViewController: UITableViewController {

    let arr=["Alex","David","Alex","Peter","Tom","Alex","Peter"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=arr[indexPath.row]
        // Configure the cell...

        return cell
    }
   

}
