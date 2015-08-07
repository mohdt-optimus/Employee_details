//
//  BrowseViewController.m
//  EmployeeDetails
//
//  Created by optimusmac-12 on 28/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "BrowseViewController.h"
#import "DB.h"
#import "BrowseSecondViewController.h"

@interface BrowseViewController ()

@property (nonatomic, strong) DB *dbManager;

@property (nonatomic, strong) NSArray *arrEmpInfo;

@end

@implementation BrowseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tblview.delegate = self;
    self.tblview.dataSource = self;
    
    self.dbManager = [[DB alloc] initWithDatabaseFilename:@"employeeDB.sqlite"];
    
    [self loadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData
{
    // Form the query.
    NSString *query = @"select * from employee order by empCode";
    
    // Get the results.
    if (self.arrEmpInfo != nil)
    {
        self.arrEmpInfo = nil;
    }
    self.arrEmpInfo = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    [self.tblview reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrEmpInfo.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Dequeue the cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellRecord" forIndexPath:indexPath];
    
    NSInteger indexOfEmpCode = [self.dbManager.arrColumnNames indexOfObject:@"empCode"];
    NSInteger indexOfName = [self.dbManager.arrColumnNames indexOfObject:@"name"];
    // Set the loaded data to the appropriate cell labels.
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[[self.arrEmpInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfName]];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueDetail"])
    {
        NSInteger indexOfName = [self.dbManager.arrColumnNames indexOfObject:@"name"];
        NSInteger indexOfDesignation = [self.dbManager.arrColumnNames indexOfObject:@"designation"];
        NSInteger indexOfDepartment = [self.dbManager.arrColumnNames indexOfObject:@"department"];
        NSInteger indexOfTagLine = [self.dbManager.arrColumnNames indexOfObject:@"tagLine"];
        NSInteger indexOfEmpCode = [self.dbManager.arrColumnNames indexOfObject:@"empCode"];
        NSInteger indexOfImage = [self.dbManager.arrColumnNames indexOfObject:@"pic"];
        //Storing index of each field
        
        NSIndexPath *indexPath = [self.tblview indexPathForSelectedRow];
        
        BrowseSecondViewController *destViewController = segue.destinationViewController;
        //Updating the values of BrowseSecondViewController to show the details fetched through segue
        destViewController.name = [NSString stringWithFormat:@"%@", [[self.arrEmpInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfName]];
        destViewController.designation  = [NSString stringWithFormat:@"%@", [[self.arrEmpInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfDesignation]];
        destViewController.department  = [NSString stringWithFormat:@"%@", [[self.arrEmpInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfDepartment]];
        destViewController.tagLine  = [NSString stringWithFormat:@"%@", [[self.arrEmpInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfTagLine]];
        destViewController.empCode  = [NSString stringWithFormat:@"%@", [[self.arrEmpInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfEmpCode]];
        destViewController.actualImageView  = [NSString stringWithFormat:@"%@", [[self.arrEmpInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfImage]];
        
   
        
    }
}


@end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


