//
//  AccessibilityMethodsViewController.m
//  AccessibilityDemo2
//
//  Created by Serene IT on 16/09/2015.
//  Copyright (c) 2015 Serene IT. All rights reserved.
//

#import "AccessibilityMethodsViewController.h"

@interface AccessibilityMethodsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *switchIsVoiceOverRunning;
@property (weak, nonatomic) IBOutlet UISwitch *switchIsBoldTextEnabled;
@property (weak, nonatomic) IBOutlet UISwitch *switchIsClosedCaptioningEnabled;
@property (weak, nonatomic) IBOutlet UISwitch *switchDarkerSystemColorsEnabled;
@property (weak, nonatomic) IBOutlet UISwitch *switchIsGrayscaleEnabled;
@property (weak, nonatomic) IBOutlet UISwitch *switchIsGuidedAccessEnabled;
@property (weak, nonatomic) IBOutlet UISwitch *switchIsInvertColorsEnabled;
@property (weak, nonatomic) IBOutlet UISwitch *switchIsMonoAudioEnabled;
@property (weak, nonatomic) IBOutlet UISwitch *switchIsReduceMotionEnabled;
@property (weak, nonatomic) IBOutlet UISwitch *switchIsReduceTransparencyEnabled;
@property (weak, nonatomic) IBOutlet UISwitch *switchIsSpeakScreenEnabled;
@property (weak, nonatomic) IBOutlet UISwitch *switchIsSpeakSelectionEnabled;
@property (weak, nonatomic) IBOutlet UISwitch *switchIsSwitchControlRunning;

@end

@implementation AccessibilityMethodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self registerForAccessibilityNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [self updateSwitches];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Private Methods
/*!
 @brief  Registers to listen to accessibility notifications.
 */
-(void)registerForAccessibilityNotifications{
    [self registerForAccessibilityNotification:UIAccessibilityBoldTextStatusDidChangeNotification];
    [self registerForAccessibilityNotification:UIAccessibilityClosedCaptioningStatusDidChangeNotification];
    [self registerForAccessibilityNotification:UIAccessibilityDarkerSystemColorsStatusDidChangeNotification];
    [self registerForAccessibilityNotification:UIAccessibilityGrayscaleStatusDidChangeNotification];
    [self registerForAccessibilityNotification:UIAccessibilityGuidedAccessStatusDidChangeNotification];
    [self registerForAccessibilityNotification:UIAccessibilityInvertColorsStatusDidChangeNotification];
//    [self registerForAccessibilityNotification:UIAccessibilityLayoutChangedNotification];
    [self registerForAccessibilityNotification:UIAccessibilityMonoAudioStatusDidChangeNotification];
//    [self registerForAccessibilityNotification:UIAccessibilityPageScrolledNotification];
//    [self registerForAccessibilityNotification:UIAccessibilityPauseAssistiveTechnologyNotification];
    [self registerForAccessibilityNotification:UIAccessibilityReduceMotionStatusDidChangeNotification];
    [self registerForAccessibilityNotification:UIAccessibilityReduceTransparencyStatusDidChangeNotification];
//    [self registerForAccessibilityNotification:UIAccessibilityResumeAssistiveTechnologyNotification];
//    [self registerForAccessibilityNotification:UIAccessibilityScreenChangedNotification];
    [self registerForAccessibilityNotification:UIAccessibilitySpeakScreenStatusDidChangeNotification];
    [self registerForAccessibilityNotification:UIAccessibilitySpeakSelectionStatusDidChangeNotification];
    [self registerForAccessibilityNotification:UIAccessibilitySwitchControlStatusDidChangeNotification];
    [self registerForAccessibilityNotification:UIAccessibilityVoiceOverStatusChanged];
    
}

/*!
 @brief  Registers a single notification to update the switches.
 @param notification	UIAccessibilityNotification name.
 */
-(void)registerForAccessibilityNotification:(NSString *)notification{
    //Register a notification handler.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateSwitches)
                                                 name:notification
                                               object:nil];
}

/*!
 @brief  Checks the UIAccessibility status and updates the switches.
 */
-(void)updateSwitches{
    self.switchIsVoiceOverRunning.on = UIAccessibilityIsVoiceOverRunning();
    self.switchIsBoldTextEnabled.on = UIAccessibilityIsBoldTextEnabled();
    self.switchIsClosedCaptioningEnabled.on = UIAccessibilityIsClosedCaptioningEnabled ();
    self.switchDarkerSystemColorsEnabled.on = UIAccessibilityDarkerSystemColorsEnabled ();
    self.switchIsGrayscaleEnabled.on = UIAccessibilityIsGrayscaleEnabled ();
    self.switchIsGuidedAccessEnabled.on = UIAccessibilityIsGuidedAccessEnabled ();
    self.switchIsInvertColorsEnabled.on = UIAccessibilityIsInvertColorsEnabled ();
    self.switchIsMonoAudioEnabled.on = UIAccessibilityIsMonoAudioEnabled ();
    self.switchIsReduceMotionEnabled.on = UIAccessibilityIsReduceMotionEnabled ();
    self.switchIsReduceTransparencyEnabled.on = UIAccessibilityIsReduceTransparencyEnabled ();
    self.switchIsSpeakScreenEnabled.on = UIAccessibilityIsSpeakScreenEnabled ();
    self.switchIsSpeakSelectionEnabled.on = UIAccessibilityIsSpeakSelectionEnabled ();
    self.switchIsSwitchControlRunning.on = UIAccessibilityIsSwitchControlRunning ();

}
@end
