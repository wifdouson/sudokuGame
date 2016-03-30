//
//  CHAlertSheet.h
//  CHBBPosDemo
//
//  Created by apple on 16/2/26.
//  Copyright © 2016年 chenhanqingdev.com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CHAlertSheet : NSObject

//这里点击的触发效果是单独写的
+ (UIAlertController *)sheetWithTitle:(NSString *)title WithMessage:(NSString *)message WithFirstTitle:(NSString *)firstTitle andClick:(void(^)(NSString * str1)) firstSheetBlock andCancelTitle:(NSString *)cancelTitle andClick:(void(^)(NSString * str2)) cancelSheetBlock;

//也可以用一个数组来进行创建，但是触发的效果只能用数组的index 来确定
+ (UIAlertController *)sheetWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelTitle:(NSString *)cancelTitle andClick:(void (^)(NSString * cancelStr)) cancelSheetBlock andArrayTitle:(NSArray *)titleArr withIndexClick:(void(^)(NSInteger index)) indexClick;

//创建一个对话框
+ (UIAlertController *)alertWithTitle:(NSString *)title WithMessage:(NSString *)message WithCanceltTitle:(NSString *)cancelTitle andClick:(void(^)(NSString * cancelStr)) cancelAlertBlock WithRightTitle:(NSString *)rightTitle andClick:(void(^)(NSString * rightStr))rightAlertBlock;

@end
