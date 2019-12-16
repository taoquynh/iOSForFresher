//
//  SleepInOtherThreadVC.swift
//  GrandCentralDispatch
//

import UIKit

class SleepInOtherThreadVC: UIViewController {
    let queue = DispatchQueue(label: "queue", qos: .background, attributes: .concurrent)
   
    @IBAction func sleepButFine(_ sender: Any) {
        
        queue.async {
            print("Do something very slow here")
            sleep(5)
            print("Done")
        }
    }
    

    
}
