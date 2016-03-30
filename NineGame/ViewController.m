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
            if(level1_1[i][j]==0){
                [btn setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
            }
                    
                    
            
            btn.tag=i*10+j;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:btn];
            
            /* 修改一下代码，判断该位置是否为0，如果为0，则不显示 2.png
            [btn setTitle:[NSString stringWithFormat:@"%d",level1_1[i][j]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"2.png"]
                 forState:UIControlStateNormal];
            btn.tag=i*10+j;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:btn];
             */
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
        [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn1];
    }
    

}

// 下面的1-9按钮 想单独生成，没实现成功，待研究。
/*
-(void)setNumView{
    //生成1-9的button
    for (int m =0; m<9; m++) {
        int x = 10+m*35;
        int y =70+9*35+15;
        UIButton *btn1 =[self btnReturn];
        btn1.frame = CGRectMake(x, y, 30, 30);
        [btn1 setTitle:[NSString stringWithFormat:@"%d",chick_button[m]] forState:UIControlStateNormal];
        [btn1 setImage:[UIImage imageNamed:@"bt0_1"] forState:UIControlStateNormal];
        btn1.tag=m;
        [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn1];
    }
}
*/


// 点击该位置，修改显示的数字
-(void)changeNum:(UIButton *)btn{
    int indextag=(int)btn.tag;
    int x=indextag/10;
    int y=indextag%10;
    int num = level1_1[x][y];
    int num_answer=answer1_1[x][y];
    if(num==0&&x<9){
       ///
        
        //这个btntitle就是button上面的文字
        if(btn.selected=YES){
            NSString * btnTitle = btn.titleLabel.text;
            [btnTitle setValue:btn.titleLabel.text forKey:nil];
            mark1=btn.tag;
            
        }
        
        
    }
}


//对btn进行处理，这里的btn是单独定义了个变量，跟上面的btn不一样。
// 提醒答案按钮
/*
- (void)btnClick:(UIButton *)btn{
    
 
    //进行差错处理
    int indextag=(int)btn.tag;
    int x=indextag/10;
    int y=indextag%10;
    int num=level1_1[x][y];
    int num_answer= answer1_1[x][y];
    if (x<9&&num==0) {
        
        
        
        [self presentViewController:[CHAlertSheet alertWithTitle:@"" WithMessage:[NSString stringWithFormat:@"应该填写的数是:%d",num_answer] WithCanceltTitle:@"取消" andClick:^(NSString *cancelStr) {
            
            
        } WithRightTitle:@"确定填写" andClick:^(NSString *rightStr) {
            [btn setImage:nil forState:UIControlStateNormal];
            
        }] animated:YES completion:nil];
        
        
    } else {
        return;
        
        
    }
    
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
