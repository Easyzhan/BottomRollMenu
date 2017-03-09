//
//  ViewController.m
//  BottomRollMenu
//
//  Created by Zin_戦 on 17/3/9.
//  Copyright © 2017年 Zin_戦. All rights reserved.
//
#define REUSE_ID @"reuse"
#import "ViewController.h"
#import "RollMenuLayout.h"
#import "RollCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property NSMutableArray *listOfData;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.listOfData = [@[@"climb",@"ice",@"lake",@"shark",@"whale",@"climb",@"ice",@"lake",@"shark",@"whale",@"climb",@"ice",@"lake",@"shark",@"whale"]mutableCopy];
    
    
    UIVisualEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:effect];
    effectView.frame = self.collectionView.bounds;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.collectionView.bounds];
    imageView.image = [UIImage imageNamed:@"lake"];
    
    UIView *viewFrame = [[UIView alloc]initWithFrame:self.collectionView.bounds];
    [viewFrame addSubview:imageView];
    [viewFrame addSubview:effectView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundView = viewFrame;
    
    
    UIVisualEffectView *mainEffectView = [[UIVisualEffectView alloc]initWithEffect:effect];
    mainEffectView.frame = self.view.bounds;
    UIImageView *mainImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    mainImageView.image = [UIImage imageNamed:@"lake"];
    UIView *mainViewFrame = [[UIView alloc]initWithFrame:self.view.bounds];
    [mainViewFrame addSubview:mainImageView];
    [mainViewFrame addSubview:mainEffectView];
    
    [self.view insertSubview:mainViewFrame belowSubview:self.collectionView];

    
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.listOfData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RollCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:REUSE_ID forIndexPath:indexPath];
    
    [self configureCell:cell forItemAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(RollCollectionViewCell *)cell
   forItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *nameOfImage = self.listOfData[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:nameOfImage];
    cell.label.text = nameOfImage;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"------selected = %ld",indexPath.section);
}


@end
