//
//  UpdateUIFromOtherThreadVC.swift
//  GrandCentralDispatch
//

import UIKit

class UpdateUIFromOtherThreadVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    let queue = DispatchQueue(label: "com.test.api", qos: .background, attributes: .concurrent)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func updateUITheBadWay(_ sender: Any) {
        queue.async {
            for i in 1...5 {
                sleep(1)
                print(i)
                self.label.text = "\(i)"
            }
        }
    }
    @IBAction func updateUITheGoodWay(_ sender: Any) {
        queue.async {
            for i in 6...10 {
                sleep(1)
                DispatchQueue.main.async {
                    self.label.text = "\(i)"
                }                
            }
        }
    }
    
}
