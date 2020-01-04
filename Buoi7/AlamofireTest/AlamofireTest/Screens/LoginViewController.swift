//
//  LoginViewController.swift
//  AlamofireTest
//
//  Created by Taof on 1/4/20.
//  Copyright © 2020 Taof. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
class LoginViewController: UIViewController {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onLogin(_ sender: Any) {
        guard let phone = phoneTextField.text, !phone.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        let params = [
            "phone": phone,
            "password": password
        ]
        
        let url = "http://45.118.145.149:8100/login"
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseObject { [weak self] (response: DataResponse<ObjectResult>) in
            guard let _ = self, let res = response.result.value else { return }
            if res.code == 0 {
                guard let data = res.data else { return }
                let token = data.token
                UserDefaults.standard.set(token, forKey: "token")
            }else{
                print(res.message)
            }
        }
    }
}
