//
//  SecondInterfaceController.m
//  sokubakuWatch
//
//  Created by 酒井文也 on 2015/01/24.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

#import "SecondInterfaceController.h"
#import "WKTableCell.h"

@implementation SecondInterfaceController
{
    NSArray *arrayObjectForLabel;
    NSArray *arrayObjectForTime;
    NSArray *arrayObjectForSecond;
    int counter;
}

- (instancetype)initWithContext:(id)context
{
    self = [super initWithContext:context];
    if (self){
        NSLog(@"%@ initWithContext", self);
    }
    return self;
}

- (void)willActivate
{
    NSLog(@"%@ will activate", self);
    
    //項目配列の初期化
    arrayObjectForLabel  = @[@"カップ麺",@"お風呂",@"DVD鑑賞",@"お洗濯",@"デート",@"お買い物",@"お料理",@"お掃除",@"定時退社"];
    arrayObjectForTime   = @[@"3分",@"30分",@"90分",@"20分",@"1日",@"120分",@"180分",@"1時間",@"8時間"];
    arrayObjectForSecond = @[@180,@1800,@5400,@1200,@86400,@7200,@10800,@3600,@28800];
    
    counter = (int)arrayObjectForLabel.count;
    
    [self.sokubakuTable setNumberOfRows:counter withRowType:@"cell"];
    
    //テーブルビューを表示する
    for (int i = 0; i < self.sokubakuTable.numberOfRows; i++) {
        WKTableCell* theRow = [self.sokubakuTable rowControllerAtIndex:i];
        
        [theRow.sokubakuName setText:arrayObjectForLabel[i]];
        [theRow.sokubakuTime setText:arrayObjectForTime[i]];
    }
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {

    //セグエなしの遷移を行う
    int targetIndex = (int)rowIndex;
    
    NSLog(@"%d",targetIndex);
    NSLog(@"%@",arrayObjectForSecond[targetIndex]);
    
    [self pushControllerWithName:@"ThirdView" context:arrayObjectForSecond[targetIndex]];
}



- (void)didDeactivate
{
    NSLog(@"%@ did deactivate", self);
}

@end
