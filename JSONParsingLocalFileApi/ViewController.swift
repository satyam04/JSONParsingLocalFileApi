//
//  ViewController.swift
//  JSONParsingLocalFileApi
//
//  Created by Satyam Saluja on 13/09/17.
//  Copyright © 2017 Satyam Saluja. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //getting the path of the local file
        guard let path = Bundle.main.path(forResource: "APIUser", ofType: "txt") else {return}
        //converting the path to a URL
        let url=URL(fileURLWithPath: path)
        // getting the data from the url
        do {
            let data = try Data(contentsOf: url)
            
            // now serializing the data in json format
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            //print(json)
            
            // now convering the json data into array
            guard let array = json as? [AnyObject] else {return}
            //print(array)
            
            //now moving through each array element and converting the array element into a dictionary format
            for user in array {
                guard let UserDict = user as? [String:AnyObject] else { return }
                
                guard let Username = UserDict["name"] as? String else { return }
                
                guard let id=UserDict["id"] as? Int else{ print("not a interger format"); return}
                
                guard let company=UserDict["company"] as? [String:String] else {return}
                
                guard let companyName=company["name"] else {return}
                
                guard let address=UserDict["address"] as? [String:AnyObject] else { return}
                
                guard let cityName=address["city"] else{return}
                
                print("UserId-->\(id)")
                print("NAME-->\(Username)")
                print("CompanyName-->\(companyName)")
                print("city-->\(cityName)")
                print("  ")
                
                
                
            }
            
        
        } catch  {
            print(error)
        }
        
        
    }

}

