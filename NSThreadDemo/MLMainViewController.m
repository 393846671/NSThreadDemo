//
//  MLMainViewController.m
//  NSThreadDemo
//
//  Created by mao lin on 14-5-29.
//  Copyright (c) 2014年 mao lin. All rights reserved.
//

#import "MLMainViewController.h"

@interface MLMainViewController ()

@end

@implementation MLMainViewController{
    UIImageView * iv;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    iv = [[UIImageView alloc]initWithFrame:CGRectMake(20.0f, 64.0f,
                                                                    self.view.bounds.size.width-40.0f, 200.0f)];
    iv.backgroundColor = [UIColor grayColor];
    [self.view addSubview:iv];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100.0f, 300.0f, 120.0f, 40.0f)];
    [btn setTitle:@"获取图片" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(downloadImage:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)downloadImage:(id)sender{
    [self performSelector:@selector(downloadData) withObject:nil];
    NSLog(@"%s",__FUNCTION__);
}

-(void)downloadData{
    NSData * data = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:@"http://img.wz6.org/uploads/allimg/120423/1-120423132210.jpg"]];
    UIImage * image = [[UIImage alloc]initWithData:data];
    if (image) {
        [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
        NSLog(@"image is good");
    }else{
        NSLog(@"image is nil");
    }
    NSLog(@"%s",__FUNCTION__);
}

-(void)updateUI:(id)data{
    NSLog(@"%s",__FUNCTION__);
    if (data) {
        iv.image = (UIImage *)data;
    }
}
@end
