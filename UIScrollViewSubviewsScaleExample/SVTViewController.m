//
//  SVTViewController.m
//  UIScrollViewSubviewsScaleExample
//
//  Created by Tsyganov Stanislav on 26.06.14.
//  Copyright (c) 2014 Tsyganov Stanislav. All rights reserved.
//

#import "SVTViewController.h"

@interface SVTViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSArray *buttonsArray;

@end

@implementation SVTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.scrollView.minimumZoomScale = 1;
  self.scrollView.maximumZoomScale = 20.0;
  
  [self fillButtonsArray];
}

- (void)fillButtonsArray
{
  NSMutableArray *mutButtonsArray = [[NSMutableArray alloc] init];
  for (int i = 0; i < 100; i++) {
    NSInteger x = arc4random_uniform(CGRectGetWidth(self.view.frame));
    NSInteger y = arc4random_uniform(CGRectGetHeight(self.view.frame));
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, 25.0, 25.0)];
    [button setImage:[UIImage imageNamed:@"icon_button_productOverlay"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(plusButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [mutButtonsArray addObject:button];
    [self.contentView addSubview:button];
  }
  self.buttonsArray = mutButtonsArray;
}

- (void)plusButtonPressed
{
  NSLog(@"button pressed");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
  return self.contentView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
  NSLog(@"scale: %f", _scrollView.zoomScale);
  [self scaleButtons];
  
}

- (void)scaleButtons
{
  for (UIButton *btn in self.buttonsArray) {
    btn.transform = CGAffineTransformMakeScale(1 / _scrollView.zoomScale, 1 / _scrollView.zoomScale);
  }
}

@end
