//
//  VIPERObjects.m
//  VIPERBuilder
//
//  Created by Mike MacDougall on 1/23/17.
//  Copyright © 2017 Etsy. All rights reserved.
//

#import "VIPERObjects.h"

@implementation VIPERInteractor
@end

@implementation VIPERPresenter
@end

@implementation VIPERRouter
- (UINavigationController *)navController {
    return self.controller.navigationController;
}
@end
