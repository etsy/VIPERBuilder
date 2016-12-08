//
//  VIPERBuilderObjCBaseTests.m
//
//  Created by Mike MacDougall on 1/23/17.
//  Copyright © 2017 Etsy. All rights reserved.
//

#import <XCTest/XCTest.h>
@import VIPERBuilder;

@interface VIPERBuilderObjCBaseTests : XCTestCase
@property (nonatomic, strong) UINavigationController *nav;
@property (nonatomic, strong) VIPERBuilderObjC <VIPERInteractor *, VIPERPresenter *, VIPERRouter *> *baseBuilder;
@end

@implementation VIPERBuilderObjCBaseTests

- (void)setUp {
    [super setUp];
    UIViewController *vc = [[UIViewController alloc] init];
    self.nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.baseBuilder = [[VIPERBuilderObjC alloc] initWithInteractor:[VIPERInteractor new]
                                                          presenter:[VIPERPresenter new]
                                                             router:[VIPERRouter new]
                                                         controller:vc];
    
}

- (void)testBaseBuilder {
    XCTAssertNotNil(self.baseBuilder.interactor);
    XCTAssertNotNil(self.baseBuilder.presenter);
    XCTAssertNotNil(self.baseBuilder.router);
}

- (void)testBaseInteractor {
    XCTAssertNotNil(self.baseBuilder.interactor.router);
    XCTAssertNotNil(self.baseBuilder.interactor.presenter);
}

- (void)testBasePresenter {
    XCTAssertNotNil(self.baseBuilder.presenter.controller);
    XCTAssertNotNil(self.baseBuilder.presenter.interactor);
}

- (void)testBaseRouter {
    XCTAssertNotNil(self.baseBuilder.router.navController);
}

@end
