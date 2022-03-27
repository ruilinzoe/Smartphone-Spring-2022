//
//  ViewController.swift
//  PromisesExample
//
//  Created by Ruilin 😈 on 3/27/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire
import PromiseKit

class ViewController: UIViewController {
    
    let shortQuoteURL="https://financialmodelingprep.com/api/v3/quote-short/FB?apikey="
    let apiKey = "9d42e78781059aed0198a2cd59c0306c"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getDataAction(_ sender: Any) {
        let url=shortQuoteURL+apiKey
        getStockData(url).done{quote in
            print(quote.price)
            print(quote.volume)
            print(quote.symbol)
        }.catch{error in
            print(error.localizedDescription)
        }
        
    }
    
    func getStockData(_ url: String) -> Promise<QuoteShort>{
        return Promise<QuoteShort>{seal ->Void in
            AF.request(url).responseJSON { response in
                if response.error != nil{
                    seal.reject(response.error!)
                }
                let stocks=JSON(response.data!).array
                
                guard let stock=stocks!.first else{
                    return
                }
                let quote=QuoteShort()
                quote.symbol=stock["symbol"].stringValue
                quote.price=stock["price"].floatValue
                quote.volume=stock["volume"].intValue
                seal.fulfill(quote)
            }
        }
    }
    
}

