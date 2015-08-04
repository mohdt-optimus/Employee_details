//
//  SearchViewController.m
//  EmployeeDetails
//
//  Created by optimusmac-12 on 28/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "SearchViewController.h"

#import "DB.h"
@interface SearchViewController ()
@property (nonatomic, strong) NSArray *arrEmpInfo;
@property (nonatomic, strong) DB *dbManager;
@property (nonatomic,strong ) NSArray *results;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.dbManager = [[DB alloc] initWithDatabaseFilename:@"employeeDB.sqlite"];
    //employeeDB is database where data will be saved
    self.nameKey.delegate=self;
    self.empCodeKey.delegate=self;
    self.empCodeKey.delegate=self;
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

- (IBAction)searchNameDesignation:(id)sender
{
    NSString *query = [NSString stringWithFormat:@"select * from employee where name=\'%@\' and designation=\'%@\'",self.nameKey.text,self.designationKey.text];
   //Query to fetch the information where name and designation match
    if (self.results != nil)
    {
        self.results = nil;
    }
    self.results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    if(self.results.count==0)               //Checking if any result is found.
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Message"
                                                          message:@"Record Not Found"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        //Showing alert box if no name , designation combitnation is obtained
        [message show];
        _empCodeLabel.hidden=true;
        _nameLabel.hidden=true;
        _designationLabel.hidden=true;
        _departmentLabel.hidden=true;
        _tagLineLabel.hidden=true;
        _tagEmp.hidden=true;
        _tagName.hidden=true;
        _tagDesignation.hidden=true;
        _tagDepartment.hidden=true;
        _tagTagLine.hidden=true;
        _picView.hidden=true;
        

        
    }
    else
    {          //If record found then update the values of labels with the fetched detail
    _empCodeLabel.text=[[_results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"empCode"]];
    _nameLabel.text=[[_results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"name"]];
    _designationLabel.text=[[_results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"designation"]];
    _departmentLabel.text=[[_results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"department"]];
    _tagLineLabel.text=[[_results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"tagLine"]];

        _picView.image=[self loadImage:[[_results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"pic"]]];
        _empCodeLabel.hidden=false;                 //Enabling all the labels to be visible with all the details
        _nameLabel.hidden=false;
        _designationLabel.hidden=false;
        _departmentLabel.hidden=false;
        _tagLineLabel.hidden=false;
        _tagEmp.hidden=false;
        _tagName.hidden=false;
        _tagDesignation.hidden=false;
        _tagDepartment.hidden=false;
        _tagTagLine.hidden=false;
        _picView.hidden=false;
        _empCodeKey.text=@"";
    }
}


- (IBAction)searchEmpCode:(id)sender
{
    NSString *query = [NSString stringWithFormat:@"select * from employee where empCode=%d",[self.empCodeKey.text intValue]];
    //Query to search the information on the basis of employee code
    if (self.results != nil)
    {
        self.results = nil;
    }
    self.results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    if(self.results.count==0)
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Message"
                                                          message:@"Record Not Found"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        //Showing alert box if no such employee code found
        [message show];
        _empCodeLabel.hidden=true;
        _nameLabel.hidden=true;
        _designationLabel.hidden=true;
        _departmentLabel.hidden=true;
        _tagLineLabel.hidden=true;
        _tagEmp.hidden=true;
        _tagName.hidden=true;
        _tagDesignation.hidden=true;
        _tagDepartment.hidden=true;
        _tagTagLine.hidden=true;
        _picView.hidden=true;
        _nameKey.text=@"";
        _designationKey.text=@"";
        
        
    }
    else
    {       //If record found then update the values of labels with the fetched detail
        _empCodeLabel.text=[[_results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"empCode"]];
        _nameLabel.text=[[_results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"name"]];
        _designationLabel.text=[[_results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"designation"]];
        _departmentLabel.text=[[_results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"department"]];
        _tagLineLabel.text=[[_results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"tagLine"]];
        _picView.image=[self loadImage:[[_results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"pic"]]];
        _empCodeLabel.hidden=false;     //Enabling all the labels to be visible with all the details
        _nameLabel.hidden=false;
        _designationLabel.hidden=false;
        _departmentLabel.hidden=false;
        _tagLineLabel.hidden=false;
        _tagEmp.hidden=false;
        _tagName.hidden=false;
        _tagDesignation.hidden=false;
        _tagDepartment.hidden=false;
        _tagTagLine.hidden=false;
        _picView.hidden=false;

        
    }
    

}

-(UIImage *)loadImage: (NSString *)name
{               //This will load the image in view controller
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:
                      [NSString stringWithString:name] ];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    return image;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{               //This will dismiss keyboard when user touches any where in the view
    [self.view endEditing:YES];
}

@end
