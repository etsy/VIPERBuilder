//
//  DemoRouter.swift
//
//  Created by Mike MacDougall on 1/20/17.
//  Copyright © 2017 Etsy. All rights reserved.
//

import UIKit
import VIPERBuilder

class DemoRouter: VIPERRouter {
    func pushTestViewController() {
        let testVC = UIViewController()
        testVC.title = "Test Detail"
        testVC.view.backgroundColor = UIColor.purple
        navController?.pushViewController(testVC, animated: true)
    }
}
