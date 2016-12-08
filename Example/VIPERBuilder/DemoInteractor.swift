//
//  DemoInteractor.swift
//
//  Created by Mike MacDougall on 1/20/17.
//  Copyright © 2017 Etsy. All rights reserved.
//

import UIKit
import VIPERBuilder

class DemoInteractor: VIPERInteractor {
    func loadNumberOfItems() {
        let numberOfItems = 100
        guard let presenter = presenter as? DemoPresenter else { return }
        presenter.update(numberOfItems: numberOfItems)
    }
    
    func didSelectItem(index: Int, actionType: DemoItemActionType) {
        switch actionType {
        case .invertColor:
            guard let presenter = presenter as? DemoPresenter else { return }
            presenter.invertAndUpdate(index: index)
        case .pushViewController:
            guard let router = router as? DemoRouter else { return }
            router.pushTestViewController()
        }
    }
}
