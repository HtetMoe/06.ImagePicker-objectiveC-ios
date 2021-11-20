//
//  ViewController.h
//  ImagePicker
//
//  Created by Htet Moe Phyu on 20/11/2021.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *imageBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

