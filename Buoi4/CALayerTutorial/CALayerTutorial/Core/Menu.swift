//
//  File.swift
//  TutorialTableView
//
//  Created by Tào Quỳnh on 5/9/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import Foundation

class Section {
    var title: String
    var menu: [Menu]
    init(title: String, menu: [Menu]) {
        self.title = title
        self.menu = menu
    }
}

class Menu {
    var title: String
    var identifier: String
    
    init(title: String, identifier: String) {
        self.title = title
        self.identifier = identifier
    }
}
