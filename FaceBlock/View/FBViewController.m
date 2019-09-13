//
//  FBViewController.m
//  FaceBlock
//
//  Created by K Y on 9/13/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "FBViewController.h"
#import <WebKit/WebKit.h>
#import "UIView+Utility.h"
#import "FBTrackerURL.h"

NSString *const BASE_URL = @"https://mbasic.facebook.com";
NSTimeInterval const TIMEOUT_INTERVAL = 180.0;

@interface FBViewController () <WKNavigationDelegate, UIScrollViewDelegate, WKUIDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIBarButtonItem *backButton;
@property (nonatomic, strong) UIBarButtonItem *forwardButton;

@end

@implementation FBViewController

- (instancetype)init {
    self = [super init];
    if (self) {    }
    return self;
}

- (void)loadView {
    [super loadView];
    UIView *view = self.view;
    [view setBackgroundColor:UIColor.whiteColor];
    self.navigationController.hidesBarsOnSwipe = YES;
    _backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind
                                                                target:self
                                                                action:@selector(backButtonAction)];
    _forwardButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                                                                  target:self
                                                                  action:@selector(forwardButtonAction)];
    [self.navigationItem setLeftBarButtonItems:@[_backButton, _forwardButton]];
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    _webView = [[WKWebView alloc] initWithFrame:view.frame configuration:config];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    _webView.scrollView.delegate = self;
    [view addFillingSubview:_webView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:BASE_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:TIMEOUT_INTERVAL];
    [_webView loadRequest:request];
}

#pragma mark - Custom Action Methods

- (void)backButtonAction {
    [_webView goBack];
}

- (void)forwardButtonAction {
    [_webView goForward];
}

#pragma mark - WKNavigationDelegate
 
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    FBTrackerURL *tracker = [[FBTrackerURL alloc] initWithURLRequest:navigationAction.request];
    if ([tracker hasTracker] == YES) {
        decisionHandler(WKNavigationActionPolicyCancel);
        [webView loadRequest:[tracker getCleanRequest]];
        return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

#pragma mark - WKUIDelegate

- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}
#pragma mark - UIScrollViewDelegate

@end
