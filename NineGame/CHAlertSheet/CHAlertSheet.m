//
//  CHAlertSheet.m
//  CHBBPosDemo
//
//  Created by apple on 16/2/26.
//  Copyright © 2016年 chenhanqingdev.com.cn. All rights reserved.
//

#import "CHAlertSheet.h"

@implementation CHAlertSheet

/**
 *  单一事件sheet弹出
 *
 *  @param title            标题
 *  @param message          标题内容
 *  @param firstTitle       第一个选项标题
 *  @param firstSheetBlock  第一个选项触发事件
 *  @param cancelTitle      取消选项
 *  @param cancelSheetBlock 取消选项点击效果
 *
 *  @return 返回一个UIAlertController
 */
+ (UIAlertController *)sheetWithTitle:(NSString *)title WithMessage:(NSString *)message WithFirstTitle:(NSString *)firstTitle andClick:(void (^)(NSString * str1))firstSheetBlock andCancelTitle:(NSString *)cancelTitle andClick:(void (^)(NSString * str2))cancelSheetBlock{
    UIAlertController * sheetContrtoller=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * cancelAction=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelSheetBlock(@"cancel");
    }];
    UIAlertAction * firstAction=[UIAlertAction actionWithTitle:firstTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        firstSheetBlock(@"first");
    }];
    [sheetContrtoller addAction:cancelAction];
    [sheetContrtoller addAction:firstAction];
    
    return sheetContrtoller;
}
/**
 *  根据数组内容返回sheetcontroller
 *
 *  @param title            标题
 *  @param message          表头内容
 *  @param cancelTitle      取消标题
 *  @param cancelSheetBlock 取消触发事件
 *  @param titleArr         不确定选项数组
 *  @param indexClick       不确定数组点击事件
 *
 *  @return 返回一个UIAlertController
 */
+ (UIAlertController *)sheetWithTitle:(NSString *)title WithMessage:(NSString *)message WithCancelTitle:(NSString *)cancelTitle andClick:(void (^)(NSString *))cancelSheetBlock andArrayTitle:(NSArray *)titleArr withIndexClick:(void (^)(NSInteger))indexClick{
    UIAlertController * sheetController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * cancelAction=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelSheetBlock(@"cancel");
    }];
    [sheetController addAction:cancelAction];
    
    for (int i=0; i<titleArr.count; i++) {
        UIAlertAction * actionAction=[UIAlertAction actionWithTitle:[titleArr objectAtIndex:i] style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            indexClick(i);
        }];
        [sheetController addAction:actionAction];
    }
    return sheetController;
}

/**
 *  单一事件alert弹出
 *
 *  @param title            标题
 *  @param message          标题内容
 *  @param cancelTitle       取消标题
 *  @param cancelAlertBlock  取消触发事件
 *  @param rightTitle      确定选项
 *  @param rightAlertBlock 确定点击效果
 *
 *  @return 返回一个UIAlertController
 */
+ (UIAlertController *)alertWithTitle:(NSString *)title WithMessage:(NSString *)message WithCanceltTitle:(NSString *)cancelTitle andClick:(void(^)(NSString * cancelStr)) cancelAlertBlock WithRightTitle:(NSString *)rightTitle andClick:(void(^)(NSString * rightStr))rightAlertBlock{
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelAlertBlock(@"");
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        rightAlertBlock(@"");
    }];
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    return alert;
}

@end
