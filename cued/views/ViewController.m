//
//  ViewController.m
//  ObjectiveC_Check
//
//  Created by Karthikeyan A. on 02/10/19.
//  Copyright © 2019 Karthikeyan. All rights reserved.
//

#import "ViewController.h"
#import "ChooseHabitViewController.h"
#import "HabitTableViewController.h"
#import "CuedUser+CoreDataClass.h"
#import "AppDelegate.h"
#import "HomeHabitViewController.h"

NSString* const setCurrentIdentifier = @"setCurrentIdentifier";


@interface ViewController ()
@end


@implementation ViewController
@synthesize appleIDLoginInfoTextView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (@available(iOS 13.0, *)) {
       [self observeAppleSignInState];
       [self setupUI];
    }
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
  // [self perfomExistingAccountSetupFlows];
}   

- (void)observeAppleSignInState {
    if (@available(iOS 13.0, *)) {
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self selector:@selector(handleSignInWithAppleStateChanged:) name:ASAuthorizationAppleIDProviderCredentialRevokedNotification object:nil];
    }
}

- (void)handleSignInWithAppleStateChanged:(id)noti {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"%@", noti);
}

- (void)perfomExistingAccountSetupFlows {
    if (@available(iOS 13.0, *)) {
        ASAuthorizationAppleIDProvider *appleIDProvider = [ASAuthorizationAppleIDProvider new];
        ASAuthorizationAppleIDRequest *authAppleIDRequest = [appleIDProvider createRequest];
        ASAuthorizationPasswordRequest *passwordRequest = [[ASAuthorizationPasswordProvider new] createRequest];
        
        NSMutableArray <ASAuthorizationRequest *>* mArr = [NSMutableArray arrayWithCapacity:2];
        if (authAppleIDRequest) {
            [mArr addObject:authAppleIDRequest];
        }
        if (passwordRequest) {
            [mArr addObject:passwordRequest];
        }
        NSArray <ASAuthorizationRequest *>* requests = [mArr copy];
        ASAuthorizationController *authorizationController = [[ASAuthorizationController alloc] initWithAuthorizationRequests:requests];

        // A delegate that the authorization controller informs about the success or failure of an authorization attempt.
        authorizationController.delegate = self;
        // A delegate that provides a display context in which the system can present an authorization interface to the user.
        authorizationController.presentationContextProvider = self;   
        
        // starts the authorization flows named during controller initialization.
        [authorizationController performRequests];
    }
}

//- (IBAction)temporaryFakeLogin:(id)sender {
//    BOOL firstTimeSignup = YES;
//    if (firstTimeSignup) {
//        ChooseHabitViewController * vc = [[ChooseHabitViewController alloc]initWithNibName:@"ChooseHabitViewController" bundle:nil];
//        [self.navigationController pushViewController:vc animated:YES];
//    } else {
//        UITableViewController * tvc = [[HabitTableViewController alloc]initWithNibName:@"HabitTableViewController" bundle:nil];
//        [self.navigationController pushViewController:tvc animated:YES];
//    }
//}

- (void)setupUI {
    // Sign In With Apple
//    appleIDLoginInfoTextView = [[UITextView alloc] initWithFrame:CGRectMake(.0, 40.0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) * 0.4) textContainer:nil];
//    appleIDLoginInfoTextView.font = [UIFont systemFontOfSize:32.0];
//    [self.view addSubview:appleIDLoginInfoTextView];


    if (@available(iOS 13.0, *)) {
        // Sign In With Apple Button
        ASAuthorizationAppleIDButton *appleIDButton = [ASAuthorizationAppleIDButton new];
        appleIDButton.frame =  CGRectMake(.0, .0, CGRectGetWidth(self.view.frame) - 100.0, 50.0);
        CGPoint origin = CGPointMake(50.0, CGRectGetHeight(self.view.frame) - 100);
        CGRect frame = appleIDButton.frame;
        frame.origin = origin;
        appleIDButton.frame = frame;
        appleIDButton.cornerRadius = CGRectGetHeight(appleIDButton.frame) * 0.25;
        [self.view addSubview:appleIDButton];
        [appleIDButton addTarget:self action:@selector(handleAuthrization:) forControlEvents:UIControlEventTouchUpInside];
    }

//    NSMutableString *mStr = [NSMutableString string];
//    [mStr appendString:@"Sign In With Apple \n"];
//    appleIDLoginInfoTextView.text = [mStr copy];
}

#pragma mark - Actions

- (void)handleAuthrization:(UIButton *)sender {
    if (@available(iOS 13.0, *)) {
        ASAuthorizationAppleIDProvider *appleIDProvider = [ASAuthorizationAppleIDProvider new];
        
        ASAuthorizationAppleIDRequest *request = appleIDProvider.createRequest;
        request.requestedScopes = @[ASAuthorizationScopeFullName, ASAuthorizationScopeEmail];
        
        ASAuthorizationController *controller = [[ASAuthorizationController alloc] initWithAuthorizationRequests:@[request]];
        controller.delegate = self;
        controller.presentationContextProvider = self;
        [controller performRequests];
    }
}
 
#pragma mark - Delegate

 - (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization  API_AVAILABLE(ios(13.0)){
    
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"%@", controller);
    NSLog(@"%@", authorization);
    
    NSLog(@"authorization.credential：%@", authorization.credential);
    
    BOOL firstTimeSignup = NO;
    if ([authorization.credential isKindOfClass:[ASAuthorizationAppleIDCredential class]]) {
        // ASAuthorizationAppleIDCredential
        ASAuthorizationAppleIDCredential *appleIDCredential = authorization.credential;
        NSString *user = appleIDCredential.user;
        [[NSUserDefaults standardUserDefaults] setValue:user forKey:setCurrentIdentifier];
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [appDelegate getContext];
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"CuedUser"];
        
        [request setPredicate:[NSPredicate predicateWithFormat:@"id == %@", user]];

        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        CuedUser *userEntity = nil;
        
        if ([matches count]) {
            //Returns the existing object
            userEntity = [matches firstObject];
        } else {
            firstTimeSignup = YES;
            
            //Create a new Object
            userEntity = [NSEntityDescription insertNewObjectForEntityForName:@"CuedUser" inManagedObjectContext:context];
            userEntity.id = user;
            userEntity.givenName = appleIDCredential.fullName.givenName;
            userEntity.familyName = appleIDCredential.fullName.familyName;
            userEntity.email = appleIDCredential.email;
            [appDelegate saveContext];
        }
        NSLog(@"User Entity: %@", userEntity.debugDescription);
    }
     
    if (firstTimeSignup) {
        ChooseHabitViewController * vc = [[ChooseHabitViewController alloc]initWithNibName:@"ChooseHabitViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        HomeHabitViewController * tvc = [[HomeHabitViewController alloc]initWithNibName:@"HomeHabitViewController" bundle:nil];
        [self.navigationController pushViewController:tvc animated:YES];
    }
}
 

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error  API_AVAILABLE(ios(13.0)){
    
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"error ：%@", error);
    NSString *errorMsg = nil;
    switch (error.code) {
        case ASAuthorizationErrorCanceled:
            errorMsg = @"ASAuthorizationErrorCanceled";
            break;
        case ASAuthorizationErrorFailed:
            errorMsg = @"ASAuthorizationErrorFailed";
            break;
        case ASAuthorizationErrorInvalidResponse:
            errorMsg = @"ASAuthorizationErrorInvalidResponse";
            break;
        case ASAuthorizationErrorNotHandled:
            errorMsg = @"ASAuthorizationErrorNotHandled";
            break;
        case ASAuthorizationErrorUnknown:
            errorMsg = @"ASAuthorizationErrorUnknown";
            break;
    }
    
    NSMutableString *mStr = [appleIDLoginInfoTextView.text mutableCopy];
    [mStr appendString:errorMsg];
    [mStr appendString:@"\n"];
    appleIDLoginInfoTextView.text = [mStr copy];
    
    if (errorMsg) {
        return;
    }
    
    if (error.localizedDescription) {
        NSMutableString *mStr = [appleIDLoginInfoTextView.text mutableCopy];
        [mStr appendString:error.localizedDescription];
        [mStr appendString:@"\n"];
        appleIDLoginInfoTextView.text = [mStr copy];
    }
    NSLog(@"controller requests：%@", controller.authorizationRequests);
    /*
     ((ASAuthorizationAppleIDRequest *)(controller.authorizationRequests[0])).requestedScopes
     <__NSArrayI 0x2821e2520>(
     full_name,
     email
     )
     */
}
 
//! Tells the delegate from which window it should present content to the user.
// This is what runs after the succesful callback from the ASAuthroizationController Occurs
 - (ASPresentationAnchor)presentationAnchorForAuthorizationController:(ASAuthorizationController *)controller  API_AVAILABLE(ios(13.0)){
    
    NSLog(@"window：%s", __FUNCTION__);
    return self.view.window;
}

- (void)dealloc {
    
    if (@available(iOS 13.0, *)) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:ASAuthorizationAppleIDProviderCredentialRevokedNotification object:nil];
    }
}


@end
