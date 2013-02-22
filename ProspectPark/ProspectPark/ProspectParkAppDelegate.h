//
//  ProspectParkAppDelegate.h
//  ProspectPark
//
//  Created by Salvatore Lentini on 2/21/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;
@interface ProspectParkAppDelegate : UIResponder <UIApplicationDelegate> {
    View *view;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;
@end
