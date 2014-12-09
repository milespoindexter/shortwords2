//
//  ShortWordsAppDelegate.h
//  ShortWords2
//
//  Created by Poindexter, Miles on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShortWordsViewController;

@interface ShortWordsAppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow *window;
    ShortWordsViewController *viewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet ShortWordsViewController *viewController;

@end
