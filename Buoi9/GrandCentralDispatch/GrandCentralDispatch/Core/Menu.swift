//
//  Menu.swift
//  BootStrap
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
