//
//  UINavigationBar+YPConfigure.m
//  YPNavigationBarTransition
//
//  Created by Guoyin Lee on 24/12/2017.
//  Copyright © 2017 yiplee. All rights reserved.
//

#import "UINavigationBar+YPConfigure.h"
#import "YPBarConfiguration.h"
#import "UIImage+YPConfigure.h"

@implementation UINavigationBar (YPConfigure)

- (void) yp_adjustWithBarStyle:(UIBarStyle)barStyle tintColor:(UIColor *)tintColor {
    self.barStyle = barStyle;
    self.tintColor = tintColor;
}

- (void) yp_applyBarConfiguration:(YPBarConfiguration *)configure {
    [self yp_adjustWithBarStyle:configure.barStyle tintColor:configure.tintColor];
    
    UIImage* const transpanrentImage = [UIImage yp_transparentImage];
    if (configure.transparent) {
        self.barTintColor = nil;
        [self setBackgroundImage:transpanrentImage forBarMetrics:UIBarMetricsDefault];
    } else {
        self.translucent = configure.translucent;
        UIImage* const backgroundImage = configure.backgroundImage;
        
        if (backgroundImage) {
            self.barTintColor = nil;
            [self setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
        } else {
            self.barTintColor = configure.backgroundColor;
            [self setBackgroundImage:transpanrentImage forBarMetrics:UIBarMetricsDefault];
        }
    }
    
    self.shadowImage = transpanrentImage;
}

@end
