//
//  SearchViewController.h
//  EmployeeDetails
//
//  Created by optimusmac-12 on 28/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface SearchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameKey;
@property (weak, nonatomic) IBOutlet UITextField *designationKey;
@property (weak, nonatomic) IBOutlet UITextField *empCodeKey;

@property (weak, nonatomic) IBOutlet UILabel *empCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *designationLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLineLabel;
@property  (weak,nonatomic) IBOutlet UILabel *picLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picView;

- (IBAction)searchNameDesignation:(id)sender;

- (IBAction)searchEmpCode:(id)sender;

@property (nonatomic,strong) NSString *databasePath;
@property (nonatomic) sqlite3 *Db;


@property (weak, nonatomic) IBOutlet UILabel *tagEmp;
@property (weak, nonatomic) IBOutlet UILabel *tagName;
@property (weak, nonatomic) IBOutlet UILabel *tagDesignation;
@property (weak, nonatomic) IBOutlet UILabel *tagDepartment;
@property (weak, nonatomic) IBOutlet UILabel *tagTagLine;


@end
