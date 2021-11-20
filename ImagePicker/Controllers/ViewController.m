//
//  ViewController.m
//  ImagePicker
//
//  Created by Htet Moe Phyu on 20/11/2021.
//

#import "ViewController.h"

@interface ViewController (){
    UIImagePickerController *imgPickerCObj;
    UIImage *image;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    imgPickerCObj = [[UIImagePickerController alloc]init];
    image = [[UIImage alloc]init];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    image = [info objectForKey:UIImagePickerControllerOriginalImage]; //[info objectForKey:UIImagePickerControllerEditedImage];
    if(image){
        self.imageView.image = image;
    }
    else{
        NSLog(@"Image is null");
    }
    //[self dismissViewControllerAnimated: YES completion: nil];
}

- (IBAction)imagePickerPressed:(id)sender {
    //show action sheet
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Choose image from" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    //from gallery
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //dismiss
        [self dismissViewControllerAnimated:YES completion:^{
        }];
        
        //open gallery
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            self->imgPickerCObj = [[UIImagePickerController alloc] init];
            self->imgPickerCObj.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self->imgPickerCObj setDelegate:(id)self];
            [self presentViewController:self->imgPickerCObj animated:YES completion:nil];
            self->imgPickerCObj.allowsEditing = YES;
            self->imgPickerCObj.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypePhotoLibrary];
        }];
        
    }]];
    
    //from camera
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //dismiss
        [self dismissViewControllerAnimated:YES completion:^{
        }];
        
        //open camera
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self->imgPickerCObj = [[UIImagePickerController alloc] init];
            self->imgPickerCObj.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self->imgPickerCObj setDelegate:(id)self];
            self->imgPickerCObj.allowsEditing = YES;
            [self presentViewController:self->imgPickerCObj animated:YES completion:nil];
        }];
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        //dismiss
        [self dismissViewControllerAnimated:YES completion:^{
        }];
        
    }]];
    
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];
}

@end
