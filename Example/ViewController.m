//
//  ViewController.m
//  Example
//
//  Created by Tim on 13/05/14.
//  Copyright (c) 2014 Charismatic Megafauna Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UILabel *textLabel;
@property (nonatomic, weak) IBOutlet UIButton *changeButton;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)didTapChangeButton:(id)sender {
    if ([self.textLabel.text isEqualToString:@"The initial text"]) {
        [self.textLabel setText:@"The final text"];
    } else {
        [self.textLabel setText:@"The initial text"];
    }
}

@end
