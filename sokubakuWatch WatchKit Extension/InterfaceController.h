//
//  InterfaceController.h
//  sokubakuWatch WatchKit Extension
//
//  Created by 酒井文也 on 2015/01/24.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *titleLabel;

//束縛されているイメージを出力するイメージビュー
@property (strong, nonatomic) IBOutlet WKInterfaceImage *sokubakuImage;

//束縛される項目を選択
- (IBAction)selectBtn;

@end
