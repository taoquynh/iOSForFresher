//
//  main.swift
//  DemoLeakMemory
//
//  Created by Taof on 12/2/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation

class User{
    var age = 1
    init(age: Int){
        self.age = age
    }
    deinit {
        print("user has age: \(age) was deallocated")
    }
}
var user1: User?
user1 = User(age: 21)
user1?.age = 22
var user2: User? = User(age: 25)
user2 = user1


//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//reference1 = Person(name: "John Appleseed")
//reference2 = reference1
//reference3 = reference1
//
//
//// instance đang có 3 strong reference, xóa hết mới giải phóng bộ nhớ cho instance đó được, bỏ comment để xóa
//reference1 = nil
//reference2 = nil
//reference3 = nil

//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//    var apartment: Apartment?
//    deinit { print("\(name) is being deinitialized") }
//}
//
//class Apartment {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//    unowned var owner: Person?
//    deinit { print("Apartment \(name) is being deinitialized") }
//}
//
//var person: Person? = Person(name: "Long")
//var apartment: Apartment? = Apartment(name: "Novaland")
//
//
//person?.apartment = apartment
//apartment?.owner = person
//
//person = nil
//apartment = nil

class Fibonacci{
    var value: Int

    init(value: Int) {
        self.value = value
    }
    
    lazy var fibonacci: () -> Int = { [ weak self ] in
        var a = 0
        var b = 1

        guard let max = self?.value else {
            fatalError() // return luôn không cần return type
        }
        for _ in 0..<max{
            let temp = a
            a = b
            b = temp + a
        }
        return a
    }

    deinit {
        print("\(value) was deinitialized")
    }

}
var fibonaxi: Fibonacci? = Fibonacci(value: 7)
fibonaxi?.fibonacci()

fibonaxi = nil
