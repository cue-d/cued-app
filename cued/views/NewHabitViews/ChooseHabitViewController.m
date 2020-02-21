//
//  firstViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "ChooseHabitViewController.h"

@interface ChooseHabitViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ChooseHabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.habitEntity == nil) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [appDelegate getContext];
        self.habitEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Habit" inManagedObjectContext:context];
    }
    [self.textField setDelegate:self];
    [self.textField becomeFirstResponder];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.habitEntity != nil) {
        self.textField.text = self.habitEntity.routine_previous;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    ChooseCueViewController * fc = [[ChooseCueViewController alloc]initWithNibName:@"ChooseCueViewController" bundle:nil];
    self.habitEntity.routine_previous = textField.text;
    fc.habitEntity = self.habitEntity;
    [self.navigationController pushViewController:fc animated:YES];
    return NO;
}
- (IBAction)skipButtonPressed:(id)sender {
    HomeHabitViewController * fc = [[HomeHabitViewController alloc]initWithNibName:@"HomeHabitViewController" bundle:nil];
    [self.navigationController pushViewController:fc animated:YES];
}

@end
