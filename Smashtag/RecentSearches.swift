//
//  RecentSearches.swift
//  Smashtag
//
//  Created by Chris Lu on 10/3/15.
//  Copyright © 2015 Stanford University. All rights reserved.
//

import Foundation

class recentSearches {
    static let sharedInstances = recentSearches()
    
    var searchKeys = [String]()
    func addKey(key: String) -> Void {
        var tempList = searchKeys
        if let index = tempList.indexOf(key) {
            tempList.removeAtIndex(index)
        }
        tempList.insert(key, atIndex: 0)
        if tempList.count > 50 {
            tempList.removeLast()
        }
        searchKeys = tempList
    }
}
