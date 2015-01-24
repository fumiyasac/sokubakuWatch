//
//  WKTableCell.h
//  sokubakuWatch
//
//  Created by 酒井文也 on 2015/01/24.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface WKTableCell : NSObject

//ラベル（束縛される項目名）を表示するラベル
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *sokubakuName;

//ラベル（束縛される時間）を表示するラベル
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *sokubakuTime;

@end
