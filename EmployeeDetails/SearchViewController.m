//
//  SearchViewController.m
//  EmployeeDetails
//
//  Created by optimusmac-12 on 28/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "SearchViewController.h"
#import "DB.h"
#include <sqlite3.h>
@interface SearchViewController ()
@property (nonatomic, strong) DB *dbManager;
@property (nonatomic, strong) NSArray *arrEmpInfo,*arrResults;
@end

@implementation SearchViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)searchName:(id)sender
{
    NSString *query = [NSString stringWithFormat:@"SELECT empCode FROM employee WHERE name = \"%@\"", _nameKey.text];
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    // If the query was successfully executed then pop the view controller.
    self.arrEmpInfo = nil;
        self.arrResults = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    NSLog(@"%@",self.arrResults);
//    NSLog(@"%@",[[self.arrEmpInfo objectAtIndex:1] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"empCode"]]);
 //   _empCodeLabel.text= [[self.arrEmpInfo objectAtIndex:1] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"empCode"]];
   
    
    
    // self.txtFirstname.text = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"firstname"]];
    
           /*     _nameLabel.text = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text((__bridge sqlite3_stmt *)(self.arrEmpInfo), 1)];
        
                _designationLabel.text= [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text((__bridge sqlite3_stmt *)(self.arrEmpInfo), 2)];
                
                _departementLabel.text = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text((__bridge sqlite3_stmt *)(self.arrEmpInfo), 3)];
        
                _tagLineLabel.text = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text((__bridge sqlite3_stmt *)(self.arrEmpInfo), 4)];
                
               
                _picLabel.text = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text((__bridge sqlite3_stmt *)(self.arrEmpInfo), 5)];
                */
                
                
                [self showUIAlertWithMessage:@"Match found in database" andTitle:@"Message"];
                
             //   _nameLabel.hidden=false;
             //   _designationLabel.hidden=false;
                _empCodeLabel.hidden=false;
             
              //  _tagLineLabel.hidden=false;
              //  _departementLabel.hidden=false;
            
                
            }

    

    



-(void) showUIAlertWithMessage:(NSString*)message andTitle:(NSString*)title{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}
@end
