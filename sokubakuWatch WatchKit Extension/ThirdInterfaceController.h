//
//  ThirdInterfaceController.h
//  sokubakuWatch
//
//  Created by 酒井文也 on 2015/01/24.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

#import <WatchKit/WatchKit.h>

@interface ThirdInterfaceController : WKInterfaceController

//上部のテキスト
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *topLabelText;

//タイマー表示部分
@property (strong, nonatomic) IBOutlet WKInterfaceTimer *sokubakuTimer;

//下部のテキスト
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *bottomLabelText;

//束縛開始ボタン
@property (strong, nonatomic) IBOutlet WKInterfaceButton *sokubakuBtn;

//束縛開始ボタン
- (IBAction)startBtn;

@end
