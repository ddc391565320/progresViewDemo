//
//  ViewController.m
//  animationDemo
//
//  Created by Wade on 15/8/22.
//  Copyright (c) 2015年 Wade. All rights reserved.
//

#import "ViewController.h"
#import "WDCircleAnimationViewController.h"
#import "WDImageAnimationViewController.h"
#import "WDProgressViewController.h"

#define CPMainStoryBoard [UIStoryboard storyboardWithName:@"Main" bundle:nil]

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *dataList;
@end

@implementation ViewController

- (NSArray *)dataList
{
    if (!_dataList) {
        _dataList = [NSArray arrayWithObjects:@"转圈动画",@"图片动画",@"进度指示器",nil];
    }
    return _dataList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = self.dataList[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    [self.navigationController pushViewController:[CPMainStoryBoard instantiateViewControllerWithIdentifier:@"WDCircleAnimationViewController"] animated:YES];
    
    else if(indexPath.row == 1)
         [self.navigationController pushViewController:[CPMainStoryBoard instantiateViewControllerWithIdentifier:@"WDImageAnimationViewController"] animated:YES];
    else if(indexPath.row == 2)
        [self.navigationController pushViewController:[CPMainStoryBoard instantiateViewControllerWithIdentifier:@"WDProgressViewController"] animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

@end
