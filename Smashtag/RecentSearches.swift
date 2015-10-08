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
//        var tempList = searchKeys
//        if let index = tempList.indexOf(key) {
//            tempList.removeAtIndex(index)
//        }
        searchKeys.insert(key, atIndex: 0)
        if searchKeys.count > 3 {
            searchKeys.removeAtIndex(searchKeys.count - 1)
        }
//        searchKeys = tempList
    }
}
