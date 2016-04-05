//
//  ViewController.m
//  NineGame
//
//  Created by 陈汉青 on 16/3/28.
//  Copyright © 2016年 hqchendev.com.cn. All rights reserved.
//

#import "ViewController.h"
#import "CHAlertSheet.h"


@interface ViewController ()
{
    int preClickTag;
}


@end

 static int level1_1[9][9] = {{2,7,9,8,4,0,1,6,3},{0,6,0,9,0,0,5,8,2},{0,0,0,2,1,6,7,9,4},{1,9,3,6,8,4,2,0,7},{0,0,0,5,9,1,3,0,6},{0,0,6,0,0,0,8,1,9},{9,0,0,7,0,0,6,2,0},{6,8,0,0,3,9,4,7,5},{0,0,5,0,6,0,9,3,0}};
static int chick_button[9]={1,2,3,4,5,6,7,8,9};

static int answer1_1[9][9] ={{0,0,0,0,0,5,0,0,0},{0,6,0,9,0,0,5,8,2},{0,0,0,2,1,6,7,9,4},{1,9,3,6,8,4,2,0,7},{0,0,0,5,9,1,3,0,6},{0,0,6,0,0,0,8,1,9},{9,0,0,7,0,0,6,2,0},{6,8,0,0,3,9,4,7,5},{0,0,5,0,6,0,9,3,0}};

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    preClickTag=-1;
    self.view.backgroundColor=[UIColor orangeColor];
    
    [self setupView];
    
//    [self configView];
    
}

#pragma mark --初始化最初显示
- (void)configView{
    for(int i=0;i<9;i++){
        UIButton * btn=[self.view viewWithTag:i*10+i];
        [btn setImage:nil forState:UIControlStateNormal];
        
    }
}
- (UIButton *)btnReturn{
    UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    return btn;
}

#pragma mark --创建布局
- (void)setupView{
    
    for(int i=0;i<9;i++){
        for(int j=0;j<9;j++){
            int x=10+j*(5+30);
            int y=70+i*(5+30);
            UIButton * btn=[self btnReturn];
            btn.frame=CGRectMake(x, y, 30, 30);
            [btn setTitle:[NSString stringWithFormat:@"%d",level1_1[i][j]] forState:UIControlStateNormal];
            //            int x=0;
            [btn setUserInteractionEnabled:NO];
            if(level1_1[i][j]==0){
                [btn setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
                [btn setUserInteractionEnabled:YES];
            }
            
            
            
            btn.tag=i*10+j;
            [btn addTarget:self action:@selector(changeNum:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:btn];
            
        
        }
    }
    
    
    
    //生成1-9的button
    for (int m =0; m<9; m++) {
        int x = 10+m*35;
        int y =70+9*35+15;
        UIButton *btn1 =[self btnReturn];
        btn1.frame = CGRectMake(x, y, 30, 30);
        [btn1 setTitle:[NSString stringWithFormat:@"%d",chick_button[m]] forState:UIControlStateNormal];
        //[btn1 setImage:[UIImage imageNamed:@"bt0_1"] forState:UIControlStateNormal];
        btn1.tag=m+90;
        [btn1 addTarget:self action:@selector(bottomBtnClivked:) forControlEvents:UIControlEventTouchUpInside];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:btn1];
    }
    

}

-(void)bottomBtnClivked:(UIButton *)btn{

    UIButton *button=[self.view viewWithTag:(NSInteger)preClickTag];
    [button setTitle:btn.titleLabel.text forState:UIControlStateNormal];
}




// 点击该位置，修改显示的数字
-(void)changeNum:(UIButton *)btn{
    preClickTag = (int)btn.tag;
    
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setImage:nil forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
