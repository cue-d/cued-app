//
//  ConfirmHabitViewController.m
//  cued
//
//  Created by Justin Pezzack on 2/1/20.
//  Copyright © 2020 Justin Pezzack. All rights reserved.
//

#import "ConfirmHabitViewController.h"

@interface ConfirmHabitViewController ()

@end

@implementation ConfirmHabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    if (self.habitInfo != nil) {
        UIFont *font = [UIFont fontWithName:@"Futura" size:18.0];
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:font
                                        forKey:NSFontAttributeName];
        
        NSMutableAttributedString *whenString = [[NSMutableAttributedString alloc] initWithString:@"When I " attributes:attrsDictionary];
        NSMutableAttributedString *cueString = [[NSMutableAttributedString alloc] initWithString:[self.habitInfo valueForKey:CUE] attributes:attrsDictionary];
        [cueString addAttribute:NSUnderlineStyleAttributeName
                                value:[NSNumber numberWithInt:1]
                                range:(NSRange){0,[cueString length]}];
        [whenString appendAttributedString:cueString];
        
        NSMutableAttributedString *insteadString = [[NSMutableAttributedString alloc] initWithString:@", instead of " attributes:attrsDictionary];
        [whenString appendAttributedString:insteadString];
        NSMutableAttributedString *oldRoutineString = [[NSMutableAttributedString alloc] initWithString:[self.habitInfo valueForKey:ROUTINE_PREVIOUS] attributes:attrsDictionary];
        [oldRoutineString addAttribute:NSUnderlineStyleAttributeName
                                value:[NSNumber numberWithInt:1]
                                range:(NSRange){0,[oldRoutineString length]}];
        [whenString appendAttributedString:oldRoutineString];
        
        NSMutableAttributedString *willString = [[NSMutableAttributedString alloc] initWithString:@", I will " attributes:attrsDictionary];
        [whenString appendAttributedString:willString];
        NSMutableAttributedString *routineString = [[NSMutableAttributedString alloc] initWithString:[self.habitInfo valueForKey:ROUTINE] attributes:attrsDictionary];
        [routineString addAttribute:NSUnderlineStyleAttributeName
                                value:[NSNumber numberWithInt:1]
                                range:(NSRange){0,[routineString length]}];
        [whenString appendAttributedString:routineString];
        NSMutableAttributedString *becauseString = [[NSMutableAttributedString alloc] initWithString:@" because it makes me feel " attributes:attrsDictionary];
        [whenString appendAttributedString:becauseString];
        NSMutableAttributedString *rewardString = [[NSMutableAttributedString alloc] initWithString:[self.habitInfo valueForKey:REWARD] attributes:attrsDictionary];
        [rewardString addAttribute:NSUnderlineStyleAttributeName
                                value:[NSNumber numberWithInt:1]
                                range:(NSRange){0,[rewardString length]}];
        [whenString appendAttributedString:rewardString];
        self.habitLabel.attributedText = whenString;
//        self.cueTextfield.text = [NSString stringWithFormat:@"Cue: %@",[self.habitInfo valueForKey:CUE]];
//        self.routineTextfield.text = [NSString stringWithFormat:@"New Routine: %@",[self.habitInfo valueForKey:ROUTINE]];
//        self.previousRoutineTextfield.text = [NSString stringWithFormat:@"Old Routine: %@",[self.habitInfo valueForKey:ROUTINE_PREVIOUS]];
//        self.rewardTextfield.text = [NSString stringWithFormat:@"Reward: %@",[self.habitInfo valueForKey:REWARD]];
    }
}

- (IBAction)saveHabit:(id)sender {
    [Habit createHabitFromDictionary:@{CUE: [self.habitInfo valueForKey:CUE], ROUTINE: [self.habitInfo valueForKey:ROUTINE], ROUTINE_PREVIOUS: [self.habitInfo valueForKey:ROUTINE_PREVIOUS], REWARD: [self.habitInfo valueForKey:REWARD]}];
    NSLog(@"REAL DATA ADDED");
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
