//
//  ViewController.swift
//  SimpleCV
//
//  Created by Ed McCormic on 4/12/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var suitsArray = [Dictionary<String, AnyObject>]()
    
    enum ParsingError: Error {
        case MissingJson
        case JsonParsingError
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:
    // MARK: Data setup
    
    
    func setupData () throws {
        
        guard let filePath = Bundle.main.path(forResource: "cards", ofType: "json"), let jsonData = NSData(contentsOfFile: filePath) else {
            throw ParsingError.MissingJson
        }
        
        do {
            let parsedObject = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            suitsArray = parsedObject["suits"] as! Array
        } catch {
            throw ParsingError.JsonParsingError
        }
        
    }


}

