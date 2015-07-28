//
//  InsertViewController.h
//  EmployeeDetails
//
//  Created by optimusmac-12 on 27/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol InsertViewControllerDelegate


-(void)editingInfoWasFinished;


@end

@interface InsertViewController : UIViewController <UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *empId;
@property (weak, nonatomic) IBOutlet UITextField *designation;
@property (weak, nonatomic) IBOutlet UITextField *department;
@property (weak, nonatomic) IBOutlet UIImageView *picView;

- (void)saveImage:(UIImageView *)imageView imgName:(NSString *)name;
@property (weak, nonatomic) IBOutlet UITextField *tagline;
- (IBAction)saveButton:(id)sender;
- (IBAction)cameraButton:(id)sender;
- (IBAction)galleryButton:(id)sender;

@property (nonatomic, strong) id<InsertViewControllerDelegate> delegate;
@end
