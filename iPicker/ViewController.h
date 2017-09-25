#import <UIKit/UIKit.h>

typedef enum {
    DCColorModelRGB,
    DCColorModelHSV
} DCColorModel;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *colorModelOption;

@property (weak, nonatomic) IBOutlet UISlider *firstComponentSlider;
@property (weak, nonatomic) IBOutlet UISlider *secondComponentSlider;
@property (weak, nonatomic) IBOutlet UISlider *thirdComponentSlider;
@property (weak, nonatomic) IBOutlet UITextField *firstComponentTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondComponentTextField;
@property (weak, nonatomic) IBOutlet UITextField *thirdComponentTextField;

@property (weak, nonatomic) IBOutlet UILabel *hexacademicalColorCodeLabel;

@end

