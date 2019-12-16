//
//  DispatchAfterVC.swift
//  GrandCentralDispatch
//

import UIKit

class DispatchAfterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            
            print("Hello world")
        }
    }

}
