#import "Kiwi.h"

#import "ViewController.h"

@interface ViewController (ExampleTests)
@property (nonatomic, weak) IBOutlet UILabel *textLabel;
@property (nonatomic, weak) IBOutlet UIButton *changeButton;
-(IBAction)didTapChangeButton:(id)sender;
@end

SPEC_BEGIN(ExampleTests)

describe(@"When demonstrating the tests", ^{
    
    context(@"and instantiating the controller", ^{
        
        it(@"should instantiate the view controller", ^{
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
            [[vc shouldNot] beNil];
        });
        
    });
    
    context(@"and testing the user interface", ^{
        
        __block ViewController *vc = nil;
        
        beforeEach(^{
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
            [[vc shouldNot] beNil];
            [vc view];
        });
        
        it(@"should have a UILabel outlet", ^{
            [[vc.textLabel shouldNot] beNil];
        });
        
        it(@"should display the correct text in the label when the view is loaded", ^{
            [[vc.textLabel.text should] equal:@"The initial text"];
        });
        
        it(@"should have a UIButton outlet", ^{
            [[vc.changeButton shouldNot] beNil];
        });
        
        it(@"should have the button linked to the didTapChangeButton action", ^{
            NSArray *actionsArray = [vc.changeButton actionsForTarget:vc forControlEvent:UIControlEventTouchUpInside];
            [[actionsArray shouldNot] beNil];
            [[[actionsArray objectAtIndex:0] should] equal:@"didTapChangeButton:"];
        });
        
        it(@"should change the text when the button is tapped", ^{
            [vc didTapChangeButton:nil];
            [[vc.textLabel.text should] equal:@"The final text"];
        });
        
        it(@"should toggle the text when the button is tapped", ^{
            [vc didTapChangeButton:nil];
            [[vc.textLabel.text should] equal:@"The final text"];
            [vc didTapChangeButton:nil];
            [[vc.textLabel.text should] equal:@"The initial text"];
        });

        afterEach(^{
            vc = nil;
        });
        
    });
    
});

SPEC_END