//
//  InsertViewController.m
//  EmployeeDetails
//
//  Created by optimusmac-12 on 27/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "InsertViewController.h"
#import "DB.h"

@interface InsertViewController ()

@property (nonatomic, strong) DB *dbManager;

@end

@implementation InsertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *yourTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollTap:)];
    [self.scroller addGestureRecognizer:yourTap];
    [self.view addSubview:_scroller];
    [self.scroller setScrollEnabled:YES];


    // Do any additional setup after loading the view.
    self.dbManager = [[DB alloc] initWithDatabaseFilename:@"employeeDB.sqlite"];
    //employeeDB is our database. 
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

- (IBAction)saveButton:(id)sender {
    // Prepare the query string.
    NSString *picName=self.empId.text;
    NSString *nameWithExt=[picName stringByAppendingString:@".jpg"];
    
    NSString *query = [NSString stringWithFormat:@"insert into employee values('%d','%@','%@','%@', '%@', '%@')", [self.empId.text intValue],self.name.text,self.designation.text,self.department.text,self.tagline.text,nameWithExt];
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    [self saveImage:_picView imgName:nameWithExt];
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0)
    
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Message"
                                                          message:@"Record Saved Successfully"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        [self.delegate editingInfoWasFinished];
        
        // Pop the view controller.
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Message"
                                                          message:@"Problem Saving Record"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
    }

}

- (IBAction)cameraButton:(id)sender
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Device has no camera" delegate:nil                                                                                                                                                                                                 cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    else
    {

    UIImagePickerController *photoPicker = [[UIImagePickerController alloc] init];
    photoPicker.delegate = self;
    photoPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:photoPicker animated:YES completion:NULL];
    }
}

- (IBAction)galleryButton:(id)sender
{
    
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];


}
- (void)imagePickerController:(UIImagePickerController *)photoPicker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *selectedImage = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.picView setImage:selectedImage];
    
    [photoPicker dismissModalViewControllerAnimated:YES];
}

- (void)saveImage: (UIImageView *)imageView imgName:(NSString *)name
{
    if (imageView != nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
        
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSString* path = [documentsDirectory stringByAppendingPathComponent:
                          name];
        UIImage *img=imageView.image;
        
        NSData* data = UIImagePNGRepresentation(img);
        
        [data writeToFile:path atomically:YES];
    }
}

- (void)scrollTap:(UIGestureRecognizer*)gestureRecognizer {
    
    //make keyboard disappear , you can use resignFirstResponder too, it's depend.
    [self.view endEditing:YES];
}

@end
