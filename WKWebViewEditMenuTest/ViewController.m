//
//  ViewController.m
//  WKWebViewEditMenuTest
//
//  Created by David Wieringa on 10/20/15.
//  Copyright © 2015 Userwise Solutions. All rights reserved.
//

@import WebKit;
#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://en.wikipedia.org/wiki/Sailing"]];
    [self.webView loadRequest:request];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuWillShow:) name:UIMenuControllerWillShowMenuNotification object:[UIMenuController sharedMenuController]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuDidShow) name:UIMenuControllerDidShowMenuNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuWillHide) name:UIMenuControllerWillHideMenuNotification object:[UIMenuController sharedMenuController]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuDidHide) name:UIMenuControllerDidHideMenuNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)menuWillShow:(NSNotification *)notification
{
    NSLog(@"MENU WILL SHOW");
    
    // this does not suppress the Edit Menu as people suggest on Stackoverflow
    [UIMenuController sharedMenuController].menuVisible = NO;
}

-(void)menuDidShow
{
    NSLog(@"MENU DID SHOW");
//    [[UIMenuController sharedMenuController] setMenuVisible:NO animated:NO];
}

-(void)menuWillHide
{
    NSLog(@"MENU WILL HIDE");
}

-(void)menuDidHide
{
    NSLog(@"MENU DID HIDE");
}

@end
