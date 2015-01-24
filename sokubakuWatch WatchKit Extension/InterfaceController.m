//
//  InterfaceController.m
//  sokubakuWatch WatchKit Extension
//
//  Created by 酒井文也 on 2015/01/24.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    
    if (self)
    {
        NSLog(@"%@ initWithContext", self);
        
        //束縛イメージの画像を入れる
        NSString *donbeImageName = @"top.jpg";
        [self.sokubakuImage setImageNamed:donbeImageName];
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

//束縛行動の選択を行う
- (IBAction)selectBtn{
    
    //セグエなしの遷移を行う
    [self pushControllerWithName:@"SecondView" context:self];
}

@end
