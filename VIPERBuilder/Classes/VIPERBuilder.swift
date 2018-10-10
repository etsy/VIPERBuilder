//
//  VIPERBuilder.swift
//  Etsy
//
//  The purpose of this class is to cut down
//  on the amount of boilerplate needed for
//  VIPER and reduce any retain cycles
//
//  Usage:
//  1. Create subclasses of VIPERInteractor,
//     VIPERPresenter & VIPERRouter
//  2. Your controller should hold a strong ref
//     to an instance of VIPERBuilder (lazy var
//     makes this easy in swift since you need to 
//     pass a reference to the controller)
//  3. Call through to the VIPER methods as usual
//
//  Created by Mike MacDougall on 10/31/16.
//  Copyright © 2016 Etsy. All rights reserved.
//

import UIKit

open class VIPERBuilder<I: VIPERInteractor, P: VIPERPresenter, R: VIPERRouter>: NSObject {
    public let interactor: I
    public let presenter: P
    public let router: R
    
    public init(interactor: I = I(),
                presenter: P = P(),
                router: R = R(),
                controller: UIViewController) {
        self.interactor = interactor
        self.presenter = presenter
        self.router = router
        super.init()
        
        VIPERBuilder.setupVIPER(controller: controller,
                                    interactor: interactor,
                                    presenter: presenter,
                                    router: router)
    }
    
    static func setupVIPER(controller: UIViewController,
                           interactor: VIPERInteractor,
                           presenter: VIPERPresenter,
                           router: VIPERRouter) {
        presenter.interactor = interactor
        presenter.controller = controller
        
        interactor.presenter = presenter
        interactor.router = router
        
        router.controller = controller
    }
}
