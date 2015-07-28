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



- (IBAction)searchName:(id)sender;
@property (nonatomic,strong) NSString *databasePath;
@property (nonatomic) sqlite3 *Db;
@end
