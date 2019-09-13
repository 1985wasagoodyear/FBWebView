//
//  FBViewController.m
//  FaceBlock
//
//  Created by K Y on 9/13/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "FBViewController.h"
#import <WebKit/WebKit.h>

@interface FBViewController ()

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation FBViewController

- (instancetype)init {
    self = [super init];
    if (self) {    }
    return self;
}

- (void)loadView {
    [super loadView];
    [self.view setBackgroundColor:UIColor.whiteColor];
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config
    _webView = [[WKWebView alloc] initWithFrame:view.frame configuration:config];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
