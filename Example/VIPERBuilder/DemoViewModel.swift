//
//  DemoViewModel.swift
//
//  Created by Mike MacDougall on 1/20/17.
//  Copyright © 2017 Etsy. All rights reserved.
//

import UIKit

enum DemoItemActionType {
    case pushViewController
    case invertColor
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

class DemoViewModel {
    private var items: [DemoItem]
    init(numberOfItems: Int) {
        var tempItems = [DemoItem]()
        if numberOfItems > 0 {
            for i in 0...numberOfItems-1 {
                let isEven = i % 2 == 0
                let color = isEven ? UIColor.green : UIColor.blue
                let actionType: DemoItemActionType = isEven ? .invertColor : .pushViewController
                let item = DemoItem(color: color, actionType: actionType)
                tempItems.append(item)
            }
        }
        items = tempItems
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func item(index: Int) -> DemoItem? {
        return items[safe: index]
    }
    
    func invertColorAtIndex(index: Int) {
        guard let existingItem = items[safe: index] else { return }
        let newColor = existingItem.color == UIColor.blue ? UIColor.green : UIColor.blue
        let item = DemoItem(color: newColor, actionType: existingItem.actionType)
        if index < items.count && index >= 0 {
            items[index] = item
        }
    }
}

class DemoItem {
    let color: UIColor
    let titleColor: UIColor
    let actionType: DemoItemActionType
    init(color: UIColor, actionType: DemoItemActionType) {
        self.color = color
        self.actionType = actionType
        self.titleColor = color == UIColor.green ? UIColor.black : UIColor.white
    }
    
    func actionDescription() -> String {
        switch actionType {
        case .invertColor:
            return "Invert Color"
        case .pushViewController:
            return "Push View Controller"
        }
    }
}
