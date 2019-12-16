//
//  SyncVsAsyncVC.swift
//  GrandCentralDispatch
//

import UIKit

class SyncVsAsyncVC: UIViewController {
    let queue = DispatchQueue(label: "com.test.api", qos: .background, attributes: .concurrent)
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func runTasksInSync(_ sender: Any) {
        queue.sync {
            for i in 1...5 {
                Thread.sleep(forTimeInterval: Double.random(in: 0.01...0.09))
                print("i = \(i)")
            }
        }
        
        queue.sync {
            for j in 1...5 {
                Thread.sleep(forTimeInterval: Double.random(in: 0.01...0.09))
                print("j = \(j)")
            }
        }
    }
    
    
    @IBAction func runTasksInAsync(_ sender: Any) {
        queue.async {
            for i in 1...5 {
                Thread.sleep(forTimeInterval: Double.random(in: 0.01...0.09))
                print("i = \(i)")
            }
        }
        
        queue.async {
            for j in 1...5 {
                Thread.sleep(forTimeInterval: Double.random(in: 0.01...0.09))
                print("j = \(j)")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
