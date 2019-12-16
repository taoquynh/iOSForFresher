//
//  SafeDispatch.swift
//  ManageIssue
//
//  Created by Taof on 11/7/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation

final public class SafeDispatch {
    
    private let mainQueueKey = DispatchSpecificKey<Int>()
    private let mainQueueValue = Int(1)
    
    private static let sharedSafeDispatch = SafeDispatch()
    
    private init() {
        DispatchQueue.main.setSpecific(key: mainQueueKey, value: mainQueueValue)
    }
    
    public class func async(onQueue queue: DispatchQueue = DispatchQueue.main, forWork block: @escaping () -> Void) {
        if queue === DispatchQueue.main {
            if DispatchQueue.getSpecific(key: sharedSafeDispatch.mainQueueKey) == sharedSafeDispatch.mainQueueValue {
                block()
            } else {
                DispatchQueue.main.async {
                    block()
                }
            }
        } else {
            queue.async {
                block()
            }
        }
    }
}
