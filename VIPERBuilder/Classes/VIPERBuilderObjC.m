//
//  VIPERBuilderObjC.m
//  VIPERBuilder
//
//  Created by Mike MacDougall on 5/4/17.
//  Copyright © 2017 Etsy. All rights reserved.
//

#import "VIPERBuilderObjC.h"

@interface VIPERBuilderObjC ()
@property (nonatomic, strong) VIPERInteractor *interactor;
@property (nonatomic, strong) VIPERPresenter *presenter;
@property (nonatomic, strong) VIPERRouter *router;

@end
@implementation VIPERBuilderObjC
- (instancetype)initWithInteractor:(VIPERInteractor *)interactor
                         presenter:(VIPERPresenter *)presenter
                            router:(VIPERRouter *)router
                        controller:(UIViewController *)controller {
    self = [super init];
    if (self) {
        self.interactor = interactor;
        self.presenter = presenter;
        self.router = router;
        
        self.presenter.interactor = interactor;
        self.presenter.controller = controller;
        
        self.interactor.presenter = presenter;
        self.interactor.router = router;
        
        self.router.controller = controller;
    }
    return self;
}
@end
