//
//  SecondInterfaceController.h
//  sokubakuWatch
//
//  Created by 酒井文也 on 2015/01/24.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

#import <WatchKit/WatchKit.h>

@interface SecondInterfaceController : WKInterfaceController

//WKInterfaceTableクラスのインスタンス
@property (strong, nonatomic) IBOutlet WKInterfaceTable *sokubakuTable;

@end
