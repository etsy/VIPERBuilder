//
//  VIPERObjects.h
//  VIPERBuilder
//
//  Created by Mike MacDougall on 1/23/17.
//  Copyright © 2017 Etsy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class VIPERInteractor, VIPERPresenter, VIPERRouter;

// Interactor
// ----------
// Should contain user interaction/business logic.
//
// Presenter is used to update view after interactor alters data
//
// Router is used for navigation based on actions taken
@interface VIPERInteractor: NSObject
@property (nonatomic, weak, nullable) VIPERPresenter *presenter;
@property (nonatomic, weak, nullable) VIPERRouter *router;
@end

// Presenter
// ----------
// Should contain view configuration/change logic
// with entity objects (or alternatively view model objects)
//
// Controller is provided for presenting modals/error messages
//
// Interactor is provided as a delegate for any actions from views
@interface VIPERPresenter: NSObject
@property (nonatomic, weak, nullable) UIViewController *controller;
@property (nonatomic, weak, nullable) VIPERInteractor *interactor;
@end


// Router
// ----------
// Should contain navigation logic. Anything that requires
// pushing new screens should go here.
//
// Navigation controller is provided for pushing new screens
@interface VIPERRouter: NSObject
@property (nonatomic, weak, nullable) UIViewController *controller;
@property (nonatomic, weak, nullable, readonly) UINavigationController *navController;
@end


