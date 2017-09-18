#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - IBActions

-(IBAction)handleSegmentedControl:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == DCColorModelRGB) {
        self.firstComponentSlider.tintColor = [UIColor redColor];
        self.secondComponentSlider.tintColor = [UIColor greenColor];
        self.thirdComponentSlider.tintColor = [UIColor blueColor];
    } else {
        
        self.firstComponentSlider.tintColor =
        self.secondComponentSlider.tintColor =
        self.thirdComponentSlider.tintColor =
                    [UIColor grayColor];
        
    }
    
    [self handleSlide:nil];
    self.hexacademicalColorCodeLabel.hidden = !self.hexacademicalColorCodeLabel.hidden;
    
    self.firstComponentTextField.hidden =
    self.secondComponentTextField.hidden =
    self.thirdComponentTextField.hidden =
                    !self.firstComponentTextField.hidden;
}

-(IBAction)handleSlide:(UISlider *)sender {
    NSInteger currentSliderValue = (NSInteger)(sender.value * 255);
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         if (self.colorModelOption.selectedSegmentIndex == DCColorModelRGB) {
                             self.view.backgroundColor = [UIColor colorWithRed:self.firstComponentSlider.value
                                                                         green:self.secondComponentSlider.value
                                                                          blue:self.thirdComponentSlider.value
                                                                         alpha:1.f];
                         } else {
                             self.view.backgroundColor = [UIColor colorWithHue:self.firstComponentSlider.value
                                                                    saturation:self.secondComponentSlider.value
                                                                    brightness:self.thirdComponentSlider.value
                                                                         alpha:1.f];
                         }
                         
                     }];
    
    if ([sender isEqual:self.firstComponentSlider]) {
        self.firstComponentTextField.text = [NSString stringWithFormat:@"%ld", currentSliderValue];
    } else if ([sender isEqual:self.secondComponentSlider]) {
        self.secondComponentTextField.text = [NSString stringWithFormat:@"%ld", currentSliderValue];
    } else {
        self.thirdComponentTextField.text = [NSString stringWithFormat:@"%ld", currentSliderValue];
    }
    
    [self setHexacademicalColorCodeLabelText:self.hexacademicalColorCodeLabel
                              viaFirstNumber:(NSInteger)(self.firstComponentSlider.value * 255)
                                secondNumber:(NSInteger)(self.secondComponentSlider.value * 255)
                              andThirdNumber:(NSInteger)(self.thirdComponentSlider.value * 255)];
}

-(IBAction)handleTextField:(UITextField *)sender {
    NSInteger currentTextFieldValue = [sender.text integerValue];
    
    if ([sender isEqual:self.firstComponentTextField]) {
        self.firstComponentSlider.value = currentTextFieldValue / 255.f;
    } else if ([sender isEqual:self.secondComponentTextField]) {
        self.secondComponentSlider.value = currentTextFieldValue / 255.f;
    } else {
        self.thirdComponentSlider.value = currentTextFieldValue / 255.f;
    }
    
    [self handleSlide:nil];
    [self setHexacademicalColorCodeLabelText:self.hexacademicalColorCodeLabel
                              viaFirstNumber:(NSInteger)(self.firstComponentSlider.value * 255)
                                secondNumber:(NSInteger)(self.secondComponentSlider.value * 255)
                              andThirdNumber:(NSInteger)(self.thirdComponentSlider.value * 255)];
}

#pragma mark - Helpful

- (void) showAlertControllerWithWarning:(NSString *)warning {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning"
                                                                   message:warning
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       [self dismissViewControllerAnimated:YES completion:nil];
                                                   }
                             ];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) setHexacademicalColorCodeLabelText:(UILabel *)label viaFirstNumber:(NSInteger)first secondNumber:(NSInteger)second andThirdNumber:(NSInteger)third {
    label.text = [NSString stringWithFormat:@"#%02lx%02lx%02lx", first, second, third];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSInteger replacementInteger = [string integerValue];
    NSInteger currentValue = [textField.text integerValue];
   
    if ([string rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location != NSNotFound) {
        [self showAlertControllerWithWarning:@"Field should contain only digits"];
        return NO;
    }
    
    if (range.length > 0) {
        return YES;
    }
    
    if (replacementInteger > 255) {
        [self showAlertControllerWithWarning:@"Field should contain number in range from 0 to 255"];
        return NO;
    }
    
    if (currentValue < 10) {
        return YES;
    } else if (currentValue < 100) {
        if (currentValue * 10 + replacementInteger > 255) {
            [self showAlertControllerWithWarning:@"Field should contain number in range from 0 to 255"];
            return NO;
        } else {
            return YES;
        }
    }
    
    [self showAlertControllerWithWarning:@"Field should contain number in range from 0 to 255"];
    return NO;
}

@end
