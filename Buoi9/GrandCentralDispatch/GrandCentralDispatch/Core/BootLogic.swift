//
//  BootLogic.swift
//  BootStrap
//

import Foundation
import UIKit
class BootLogic {
    
    class func boot(window: UIWindow) {
        let mainScreen = MainScreen.init(style: .grouped)
        mainScreen.title = "Demo Grand Central Dispatch"
        mainScreen.about = "Written by Cuong@techmaster.vn"
        mainScreen.sections = [
            
            Section(title: "Basic",
                    menu: [
                        Menu(title: "Sleep", identifier: "SleepVC"),
                        Menu(title: "Sleep In Other Thread", identifier: "SleepInOtherThreadVC"),
                        Menu(title: "Wait for amount of time", identifier: "DispatchAfterVC"),
                        Menu(title: "Update UI From Other Thread", identifier: "UpdateUIFromOtherThreadVC"),
                        Menu(title: "Sync vs Async", identifier: "SyncVsAsyncVC"),
                        Menu(title: "DispatchAfterVC", identifier: "DispatchAfterVC")
                ]),
            
            Section(title: "Intermediate",
                    menu: [
                        Menu(title: "Run tasks in group", identifier: "RunTaskInGroupVC"),
                        Menu(title: "Run finite tasks concurrently", identifier: "SemaphoreVC"),
                        
        ])
        ]
                
        let navigationController = UINavigationController.init(rootViewController: mainScreen)
        window.rootViewController = navigationController
    }
}
