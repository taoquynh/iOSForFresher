//
//  ViewController.swift
//  DemoJSONService
//
//  Created by Tào Quỳnh  on 9/21/18.
//  Copyright © 2018 Tào Quỳnh . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var networkController: NetworkController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        networkController = NetworkController()
        networkController.load(urlString: NetworkController.questionURL, withCompletion: { ([Any]?) -> Void in
            //do sth
            })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

