//
//  ViewController.m
//  ObjectiveC_Check
//
//  Created by Karthikeyan A. on 02/10/19.
//  Copyright © 2019 Karthikeyan. All rights reserved.
//

#import "ViewController.h"

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
//    [self perfomExistingAccountSetupFlows];
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

- (void)setupUI {
    if (@available(iOS 13.0, *)) {
        // Sign In With Apple Button
        ASAuthorizationAppleIDButton *appleIDButton = [ASAuthorizationAppleIDButton new];
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        appleIDButton.frame =  CGRectMake(.0, .0, screenRect.size.width - 100.0, 50.0);
        CGPoint origin = CGPointMake(50.0, screenRect.size.height - 100.0);
        CGRect frame = appleIDButton.frame;
        frame.origin = origin;
        appleIDButton.frame = frame;
        appleIDButton.cornerRadius = CGRectGetHeight(appleIDButton.frame) * 0.25;
        [self.view addSubview:appleIDButton];
        [appleIDButton addTarget:self action:@selector(handleAuthrization:) forControlEvents:UIControlEventTouchUpInside];
    }
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
    
    if ([authorization.credential isKindOfClass:[ASAuthorizationAppleIDCredential class]]) {
        // ASAuthorizationAppleIDCredential
        ASAuthorizationAppleIDCredential *appleIDCredential = authorization.credential;
        NSString *user = appleIDCredential.user;
        [[NSUserDefaults standardUserDefaults] setValue:user forKey:setCurrentIdentifier];

        [CuedUser createOrGetUserFromDictionary:@{@"id": user, @"givenName": appleIDCredential.fullName.givenName, @"familyName": appleIDCredential.fullName.familyName, @"email": appleIDCredential.email}];
        
        NSArray *habits = [Habit getAllHabits];
        
        OnboardingViewController * vc = [[OnboardingViewController alloc]initWithNibName:@"OnboardingViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
//        if ([habits count]) {
//            HomeHabitViewController * tvc = [[HomeHabitViewController alloc]initWithNibName:@"HomeHabitViewController" bundle:nil];
//            [self.navigationController pushViewController:tvc animated:YES];
//        } else {
//            ChooseHabitViewController * vc = [[ChooseHabitViewController alloc]initWithNibName:@"ChooseHabitViewController" bundle:nil];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
    } else {
        NSLog(@"Invalid authorization credential kind");
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
