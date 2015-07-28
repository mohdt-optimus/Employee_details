//
//  BrowseSecondViewController.h
//  EmployeeDetails
//
//  Created by optimusmac-12 on 28/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DB.h"
@interface BrowseSecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *designationLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLineLabel;
@property (weak, nonatomic) IBOutlet UILabel *empCodeLabel;


- (UIImage *)loadImage: (NSString *)name;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *designation;
@property (nonatomic, strong) NSString *department;
@property (nonatomic, strong) NSString *empCode;
@property (nonatomic, strong) NSString *tagLine;
@property (nonatomic, strong) NSString *actualImageView;
@end