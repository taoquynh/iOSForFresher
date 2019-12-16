//
//  MainScreen.swift
//  BootStrap
//

import UIKit

class MainScreen: UITableViewController {
    var sections: [Section]?
    var about: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let rightBarButton = UIBarButtonItem.init(title: "About", style: .plain, target: self, action: #selector(onAbout))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }

    @objc func onAbout() {
        let alert = UIAlertController(title: "About", message: "Ứng dụng demo được viết bởi Trịnh Minh Cường\n cuong@techmaster.vn", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      
        
        self.present(alert, animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections!.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sections![section].menu.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "OX13"
        
        //Hãy xem kỹ định nghĩa dequeueReusableCell(withIdentifier: cellID, for: indexPath) trả về UITableViewCell non-optional
        //var cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) //trả về optional value nên phù hợp hoàn cảnh này
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellID)
            cell?.accessoryType = .disclosureIndicator
        }
        let section = sections![indexPath.section]
        let menu = section.menu[indexPath.row]
        cell!.textLabel?.text = menu.title

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = sections![section]
        return section.title
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections![indexPath.section]
        let menu = section.menu[indexPath.row]
        let appName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
        let identifier = appName + "." + menu.identifier
      
        let ViewControllerClass = NSClassFromString(identifier) as! UIViewController.Type
        
        let detailScreen = ViewControllerClass.init()
        detailScreen.title = menu.title
      
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(detailScreen, animated: true)
    }
}
