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
@property (weak, nonatomic) IBOutlet UILabel *zone;

@end

