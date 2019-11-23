//
//  ViewController.swift
//  LearnSnapKit
//
//  Created by Taof on 11/23/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let myView = UIView()
    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.backgroundColor = .gray
        addSubview()
        setupLayout()
    }
    
    func addSubview(){
        view.addSubview(myView)
        myView.addSubview(blackView)
        myView.addSubview(yellowView)
        myView.addSubview(redView)
        myView.addSubview(blueView)
        myView.addSubview(greenView)
    }
    
    func setupLayout(){
        myView.snp.makeConstraints { (make) in
            make.top.equalTo(view).inset(64)
            make.leading.equalTo(view).inset(20)
            make.trailing.equalTo(view).inset(20)
            make.bottom.equalTo(view).inset(20)
        }
        
        blackView.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        redView.snp.makeConstraints { (make) in
            make.top.equalTo(blackView.snp.bottom).offset(20)
            make.right.equalTo(blackView.snp.left).offset(-20)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        yellowView.snp.makeConstraints { (make) in
            make.top.equalTo(blackView.snp.bottom).offset(20)
            make.left.equalTo(blackView.snp.right).offset(20)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        blueView.snp.makeConstraints { make in
            make.bottom.equalTo(blackView.snp.top).offset(-20.0)
            make.left.equalTo(blackView.snp.right).offset(20.0)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }

        greenView.snp.makeConstraints { make in
            make.bottom.equalTo(blackView.snp.top).offset(-20.0)
            make.right.equalTo(blackView.snp.left).offset(-20.0)
            make.size.equalTo(CGSize(width: 100, height: 100))
    }

    }
}

