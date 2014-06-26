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

@end

@implementation SVTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.scrollView.minimumZoomScale = 1;
  self.scrollView.maximumZoomScale = 20.0;
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

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
  
}

@end
