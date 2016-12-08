//
//  VIPERBuilderObjCCustomTests.m
//
//  Created by Mike MacDougall on 1/23/17.
//  Copyright © 2017 Etsy. All rights reserved.
//

#import <XCTest/XCTest.h>
@import VIPERBuilder;

@class CustomTestInteractor, CustomTestPresenter, CustomTestRouter;

@interface DataManager: NSObject
+ (NSInteger)storedNumber;
@end
@implementation DataManager
+ (NSInteger)storedNumber {
    return 4;
}
@end

@interface CustomTestInteractor: VIPERInteractor
- (BOOL)updateNumber;
- (BOOL)tapButton;
@end

@interface CustomTestPresenter: VIPERPresenter
@property (nonatomic, assign) NSInteger numberConfig;
- (void)updateNumberConfig:(NSInteger)number;
- (NSInteger)numberToShow;
@end

@interface CustomTestRouter: VIPERRouter
@property (nonatomic, assign) BOOL didNavigate;
- (void)navigateToPage;
@end

@implementation CustomTestInteractor
- (BOOL)updateNumber {
    CustomTestPresenter *presenter = (CustomTestPresenter *) self.presenter;
    [presenter updateNumberConfig: [DataManager storedNumber]];
    return YES;
}

- (BOOL)tapButton {
    CustomTestRouter *router = (CustomTestRouter *) self.router;
    [router navigateToPage];
    return YES;
}
@end

@implementation CustomTestPresenter
- (void)updateNumberConfig:(NSInteger)number {
    self.numberConfig = number;
}

- (NSInteger)numberToShow {
    return self.numberConfig;
}
@end

@implementation CustomTestRouter
- (void)navigateToPage {
    self.didNavigate = YES;
}
@end

@interface VIPERBuilderObjCCustomTests : XCTestCase
@property (nonatomic, strong) UINavigationController *nav;
@property (nonatomic, strong) VIPERBuilderObjC *customBuilder;
@end

@implementation VIPERBuilderObjCCustomTests

- (void)setUp {
    [super setUp];
    UIViewController *vc = [[UIViewController alloc] init];
    self.nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.customBuilder = [[VIPERBuilderObjC alloc] initWithInteractor:[CustomTestInteractor new]
                                                             presenter:[CustomTestPresenter new]
                                                                router:[CustomTestRouter new]
                                                            controller:vc];
}

- (void)testCustomInteractorPresenterInteraction {
    XCTAssertTrue([(CustomTestInteractor *)self.customBuilder.interactor updateNumber]);
    XCTAssertEqual([(CustomTestPresenter *)self.customBuilder.presenter numberToShow], [DataManager storedNumber]);
}

- (void)testCustomInteractorRouterInteraction {
    XCTAssertTrue([(CustomTestInteractor *)self.customBuilder.interactor tapButton]);
    XCTAssertTrue([(CustomTestRouter *)self.customBuilder.router didNavigate]);
}

@end
