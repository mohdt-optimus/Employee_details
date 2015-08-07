//
//  BrowseSecondViewController.m
//  EmployeeDetails
//
//  Created by optimusmac-12 on 28/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "BrowseSecondViewController.h"

@interface BrowseSecondViewController ()

- (UIImage *)loadImage: (NSString *)name;
@end

@implementation BrowseSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameLabel.text=[@"Name : " stringByAppendingString:_name];              //Updating the local elements with the values recieved form the segue
    _designationLabel.text=[@"Designation : " stringByAppendingString:_designation];
    _departmentLabel.text=[@"Department : " stringByAppendingString:_department];
    _tagLineLabel.text=[@"Tag Line : " stringByAppendingString:_tagLine];
    _empCodeLabel.text=[@"Employee Code : " stringByAppendingString:_empCode];
    _imageView.image=[self loadImage:_actualImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIImage *)loadImage: (NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:
                      [NSString stringWithString:name] ];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    return image;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
