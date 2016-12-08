//
//  VIPERBuilderObjC.h
//  VIPERBuilder
//
//  Created by Mike MacDougall on 5/4/17.
//  Copyright © 2017 Etsy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VIPERObjects.h"

NS_ASSUME_NONNULL_BEGIN
@interface VIPERBuilderObjC<__covariant I: VIPERInteractor *, __covariant P: VIPERPresenter *, __covariant R: VIPERRouter *> : NSObject
@property (nonatomic, readonly) I interactor;
@property (nonatomic, readonly) P presenter;
@property (nonatomic, readonly) R router;
- (instancetype)initWithInteractor:(I)interactor presenter:(P)presenter router:(R)router controller:(UIViewController *)controller;
@end
NS_ASSUME_NONNULL_END
