//
//  ViewController.swift
//  NailStock
//
//  Created by Ruilin 😈 on 3/2/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    @IBOutlet weak var lblStockPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getStockPrice(_ sender: Any) {
        
        guard let symbol=txtStockSymbol.text  else{return}
        let url="\(shortQuoteURL)\(symbol.uppercased())?apikey=\(apiKey)"
        print(url)
        SwiftSpinner.show("Get Stock Value for \(symbol)")
        
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            //what is nil?
            if (response.error != nil){
                print(response.error!)
                return
            }
            //here I have got the data
            let stocks=JSON(response.data!).array
            
            guard let stock=stocks!.first else{
                return
            }
            print(stocks)
            
            let quote=Quote()
            quote.symbol=stock["symbol"].stringValue
            quote.change=stock["change"].floatValue
//            quote.volume=stock["volume"].intValue
            
            self.lblStockPrice.text="\(quote.symbol) Change:\(quote.change)$"
        }
    }
}
