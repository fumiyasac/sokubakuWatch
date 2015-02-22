//
//  ThirdInterfaceController.m
//  sokubakuWatch
//
//  Created by 酒井文也 on 2015/01/24.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

#import "ThirdInterfaceController.h"

@implementation ThirdInterfaceController
{
    NSTimer *doneTimer;
    NSString *duration;
}

- (instancetype)initWithContext:(id)context
{
    self = [super init];
    if (self){
        
        //ラベルの初期値を設定
        [self.topLabelText setText:@"これから"];
        [self.bottomLabelText setText:@"束縛されます"];
        
        //呼び出し時はタイマーを止めておく
        [self.sokubakuTimer stop];
        
        //ボタンのテキストを設定する
        [self.sokubakuBtn setTitle:@"束縛される"];
        
        //メンバ変数のdurationに秒数を格納
        duration = context;
        
        NSLog(@"%@ initWithContext", self);
        
    }
    return self;
}

- (void)willActivate
{
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate
{
    NSLog(@"%@ did deactivate", self);
}

- (IBAction)startBtn
{
    NSLog(@"START!");
    
    //ラベルの文字列を指定
    [self.topLabelText setText:@"残り時間"];
    [self.bottomLabelText setText:@"で解放されます"];
    
    //文字列 ⇒ float型に変換
    float fixedFloatDuration = duration.floatValue;
    
    //今日の日付から指定秒数後の時間を取得
    NSDate *targetDate = [NSDate dateWithTimeIntervalSinceNow:fixedFloatDuration];
    
    //WKInterfaceTimerのインスタンスに日付を入れる
    [self.sokubakuTimer setDate:targetDate];
    [self.sokubakuTimer start];
    
    //指定秒数後にtimerDone関数を呼び出す
    doneTimer = [NSTimer scheduledTimerWithTimeInterval:fixedFloatDuration target:self selector:@selector(timerDone:) userInfo:nil repeats:NO];
    
    //ボタンメッセージを変更
    [self.sokubakuBtn setTitle:@"束縛中です！"];
    
    //ボタンを殺す
    [self.sokubakuBtn setEnabled:NO];
}

- (void)timerDone:(NSTimer *)timer
{
    NSLog(@"STOP!");
        
    //Send count to parent application
    NSString *requestString = [NSString stringWithFormat:@"executeMethodA"];
    
    //This string is arbitrary, just must match here and at the iPhone side of the implementation.
    NSDictionary *applicationData = [[NSDictionary alloc] initWithObjects:@[requestString] forKeys:@[@"theRequestString"]];
    
    //Handle reciever in app delegate of parent app
    [WKInterfaceController openParentApplication:applicationData reply:^(NSDictionary *replyInfo, NSError *error) {
        NSLog(@"\nReply info: %@\nError: %@",replyInfo, error);
    }];
    
    //ラベルの文字列を指定
    [self.topLabelText setText:@"おめでとう！"];
    [self.bottomLabelText setText:@"解放されました！"];
    
    //ボタンメッセージを変更
    [self.sokubakuBtn setTitle:@"再度束縛開始"];
    
    //ボタンを復活
    [self.sokubakuBtn setEnabled:YES];
    
    //タイマーを止めておく
    [self.sokubakuTimer stop];
}
@end
