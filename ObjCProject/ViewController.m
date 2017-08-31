#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(IBAction)handleSegmentedControl:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == DCColorModelRGB) {
        self.firstComponentSlider.tintColor = [UIColor redColor];
        self.secondComponentSlider.tintColor = [UIColor greenColor];
        self.thirdComponentSlider.tintColor = [UIColor blueColor];
        
        [self handleSlide:nil];
        self.zone.hidden = NO;
        
    } else {
        self.firstComponentSlider.tintColor =
        self.secondComponentSlider.tintColor =
        self.thirdComponentSlider.tintColor =
        [UIColor whiteColor];
        
        [self handleSlide:nil];
        self.zone.hidden = YES;
    }
}

-(IBAction)handleSlide:(UISlider *)sender {
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
}

@end
