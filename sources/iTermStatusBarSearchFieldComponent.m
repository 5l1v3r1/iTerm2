//
//  iTermStatusBarSearchFieldComponent.m
//  iTerm2SharedARC
//
//  Created by George Nachman on 7/1/18.
//

#import "iTermStatusBarSearchFieldComponent.h"

#import "iTermMiniSearchFieldViewController.h"
#import "iTermStatusBarSetupKnobsViewController.h"
#import "NSDictionary+iTerm.h"
#import "NSObject+iTerm.h"

NS_ASSUME_NONNULL_BEGIN

@implementation iTermStatusBarSearchFieldComponent {
    iTermMiniSearchFieldViewController *_viewController;
}

- (CGFloat)statusBarComponentMinimumWidth {
    return 125;
}

- (void)statusBarComponentSizeView:(NSView *)view toFitWidth:(CGFloat)width {
    assert(view == _viewController.view);
    [_viewController sizeToFitSize:NSMakeSize(width, view.frame.size.height)];
}

- (CGFloat)statusBarComponentPreferredWidth {
    return 200;
}

- (BOOL)statusBarComponentCanStretch {
    return YES;
}

#pragma mark - iTermStatusBarComponent

+ (NSString *)statusBarComponentShortDescription {
    return @"Search Tool";
}

+ (NSString *)statusBarComponentDetailedDescription {
    return @"Search tool to find text in the terminal window.";
}

+ (NSArray<iTermStatusBarComponentKnob *> *)statusBarComponentKnobs {
    return @[];
}

- (id)statusBarComponentExemplar {
    return @"🔎 Search";
}

- (NSView *)statusBarComponentCreateView {
    return self.statusBarComponentSearchViewController.view;
}

- (NSViewController<iTermFindViewController> *)statusBarComponentSearchViewController {
    if (!_viewController) {
        _viewController = [[iTermMiniSearchFieldViewController alloc] initWithNibName:@"iTermMiniSearchFieldViewController"
                                                                               bundle:[NSBundle mainBundle]];
    }
    return _viewController;
}

@end

NS_ASSUME_NONNULL_END
