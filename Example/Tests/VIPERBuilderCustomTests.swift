//
//  VIPERBuilderCustomTests.swift
//
//  Created by Mike MacDougall on 12/8/16.
//  Copyright © 2016 Etsy. All rights reserved.
//

import XCTest
@testable import VIPERBuilder

class DataManager {
    static let storedNumber = 4
}

class CustomTestInteractor: VIPERInteractor {
    func updateNumber() -> Bool {
        guard let presenter = presenter as? CustomTestPresenter else { return false }
        presenter.updateNumberConfig(number: DataManager.storedNumber)
        return true
    }
    
    func tapButton() -> Bool {
        guard let router = router as? CustomTestRouter else { return false }
        router.navigateToPage()
        return true
    }
}

class CustomTestPresenter: VIPERPresenter {
    private var numberConfig = 0
    func updateNumberConfig(number: Int) {
        numberConfig = number
    }
    
    func numberToShow() -> Int {
        return numberConfig
    }
}

class CustomTestRouter: VIPERRouter {
    var didNavigate = false
    func navigateToPage() {
        didNavigate = true
    }
}

class VIPERBuilderCustomTests: XCTestCase {
    var nav: UINavigationController?
    
    var customBuilder: VIPERBuilder<CustomTestInteractor, CustomTestPresenter, CustomTestRouter>?
    
    override func setUp() {
        let vc = UIViewController()
        nav = UINavigationController(rootViewController: vc)
        customBuilder = VIPERBuilder(controller: vc)
    }
    
    func testCustomInteractorPresenterInteraction() {
        XCTAssertTrue(customBuilder?.interactor.updateNumber() ?? false)
        XCTAssertEqual(customBuilder?.presenter.numberToShow(), DataManager.storedNumber)
    }
    
    func testCustomInteractorRouterInteraction() {
        XCTAssertTrue(customBuilder?.interactor.tapButton() ?? false)
        XCTAssertTrue(customBuilder?.router.didNavigate ?? false)
    }
}
