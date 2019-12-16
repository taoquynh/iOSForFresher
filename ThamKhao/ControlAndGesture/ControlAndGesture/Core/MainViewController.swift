//
//  MainViewController.swift
//  TutorialTableView
//
//  Created by Tào Quỳnh on 5/9/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sections: [Section]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Control And Gesture"
        setupTableView()
        setupData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        //tất cả cell được sử dụng phải được đăng kí trước với tableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupData(){
        sections = [
            Section(title: "Control",
                    menu: [
                        Menu(title: "TextField", identifier: "TextFieldViewController"),
                        Menu(title: "TextView", identifier: "TextViewViewController"),
                        Menu(title: "Button", identifier: "ButtonViewController"),
                        Menu(title: "DatePicker", identifier: "DatePickerViewController"),
                        Menu(title: "PickerView", identifier: "PickerViewViewController"),
                        Menu(title: "Steper", identifier: "StepperViewController"),
                        Menu(title: "Switch", identifier: "SwitchViewController"),
                        Menu(title: "ScrollView", identifier: "ScrollViewViewController"),
                        Menu(title: "TableView", identifier: "TableViewViewController"),
                        Menu(title: "CollectionView", identifier: "DemoCollectionViewViewController"),
                        Menu(title: "Page Control", identifier: "PageControlViewController")
                        ]),
            Section(title: "Gesture",
                    menu: [
                        Menu(title: "Tap Gesture", identifier: "TapGesturesViewController"),
                        Menu(title: "Swipe Gesture", identifier: "SwipeGestureViewController"),
                        Menu(title: "Pinch Gesture", identifier: "PinchGestureViewController"),
                        Menu(title: "Pan Gesture", identifier: "PanGestureViewController"),
                        Menu(title: "Rotate Gesture", identifier: "RotateGestureViewController"),
                        Menu(title: "Long Press Gesture", identifier: "LongPressGestureViewController")
                        
                ])
        ]
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    // delegate trả về số section
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections!.count
    }
    
    // delegate trả về chiều cao sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // delegate trả về tên section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = sections![section]
        return section.title
    }
    
    // delegate trả về số cell trong một section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections![section].menu.count
    }
    
    // delegate trả về chiều cao cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    // delegate trả về nội dung trong một cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let section = sections![indexPath.section]
        let menu = section.menu[indexPath.row]
        cell.textLabel?.text = menu.title
        return cell
    }
    
    // delegate chọn cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections![indexPath.section]
        let menu = section.menu[indexPath.row]
        
        let appName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
        let identifier = appName + "." + menu.identifier
        let ViewControllerClass = NSClassFromString(identifier) as! UIViewController.Type
        
        let detailScreen = ViewControllerClass.init()
        detailScreen.title = menu.title
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.pushViewController(detailScreen, animated: true)
        
    }
    
    
}
