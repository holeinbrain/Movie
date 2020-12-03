//
//  SecondDetailViewController.swift
//  Movie
//
//  Created by Anton Levin on 03.12.2020.
//

import Foundation
import UIKit
class DataManager: NSObject {
    
    static var shared = DataManager()
    
    var URLReqObj:URLRequest!
    var dataTaskObj:URLSessionDataTask!
    
    override init() {
        super.init()
    }
    
    func taskDetails(type:String)->[String:Any]
    {
        var convertedData:[String:Any]!
        var URLReqObj = URLRequest(url: URL(string: type)!)
        URLReqObj.httpMethod = "GET"
        
        dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: { (dataWeGot, connDetails, err) in
            
            do {
                convertedData = try (JSONSerialization.jsonObject(with: dataWeGot!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String:Any])
                
            } catch {
                print("Some thing went worng")
            }
        })
        dataTaskObj.resume()
        
        while (convertedData == nil) {
        }
        return convertedData
    }
}
