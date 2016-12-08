//
//  VIPERBuilderBaseTests.swift
//  VIPERBuilderTests
//
//  Created by Mike MacDougall on 12/6/16.
//  Copyright © 2016 Etsy. All rights reserved.
//

import XCTest
@testable import VIPERBuilder

class VIPERBuilderBaseTests: XCTestCase {
    var nav: UINavigationController?
    
    var baseBuilder: VIPERBuilder<VIPERInteractor, VIPERPresenter, VIPERRouter>?
    
    override func setUp() {
        let vc = UIViewController()
        nav = UINavigationController(rootViewController: vc)
        baseBuilder = VIPERBuilder(controller: vc)
    }
    
    func testBaseBuilder() {
        XCTAssertNotNil(baseBuilder?.interactor)
        XCTAssertNotNil(baseBuilder?.presenter)
        XCTAssertNotNil(baseBuilder?.router)
    }
    
    func testBaseInteractor() {
        XCTAssertNotNil(baseBuilder?.interactor.router)
        XCTAssertNotNil(baseBuilder?.interactor.presenter)
    }
    
    func testBasePresenter() {
        XCTAssertNotNil(baseBuilder?.presenter.controller)
        XCTAssertNotNil(baseBuilder?.presenter.interactor)
    }
    
    func testBaseRouter() {
        XCTAssertNotNil(baseBuilder?.router.navController)
    }
    
}
