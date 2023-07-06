#include "qdatetimepicker.h"

#ifdef Q_OS_IOS
#import <UIKit/UIKit.h>
#endif

@interface DatePickerController : UIViewController <UISheetPresentationControllerDelegate>
- (instancetype) initWithDelegate:(QDateTimePicker *)qPicker;
- (void) showPicker;
- (void) selectedDateChanged;
@end

@implementation DatePickerController
{
  UIDatePicker *picker;
  QDateTimePicker *delegate;
}

- (instancetype) initWithDelegate:(QDateTimePicker *)qPicker
{
    if (self = [super init]) {
        delegate = qPicker;
        return self;
    }
}

- (void) showPicker
{
    // create and configure a view controller to present the date picker
    if (@available(iOS 15.0, *)) {
      UISheetPresentationControllerDetent *customDetent = [UISheetPresentationControllerDetent
                                                          customDetentWithIdentifier:nil
                                                          resolver:^CGFloat(id<UISheetPresentationControllerDetentResolutionContext> context)
                                                          {
                                                              return 300;
                                                          }];
      self.sheetPresentationController.detents = @[customDetent, [UISheetPresentationControllerDetent mediumDetent]];
    }
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);

    // configure date picker
    picker = [[[UIDatePicker alloc] init] autorelease];
    picker.datePickerMode = UIDatePickerModeDateAndTime;
    picker.preferredDatePickerStyle = UIDatePickerStyleWheels;
    picker.bounds = self.view.bounds;
    picker.center = CGPointMake(self.view.frame.size.width  / 2,
                                self.view.frame.size.height / 2);

    [picker addTarget:self action:@selector(selectedDateChanged) forControlEvents:UIControlEventValueChanged];

    // configure a Toolbar
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(doneButtonTapped)];
    doneButton.title = @"Done";
    toolbar.items = @[doneButton];


    // add ToolBar and date picker to the view controller
    [self.view addSubview:picker];
    [self.view addSubview:toolbar];


    // present view controller
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootVC presentViewController:self animated:YES completion:nil];
}

- (void) selectedDateChanged
{
    delegate->setSelectedDate(QDateTime::fromNSDate(picker.date));
}

- (void) doneButtonTapped
{
   UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
   [rootVC dismissViewControllerAnimated:TRUE completion:nil];
}

@end

QDateTimePicker::QDateTimePicker(QQuickItem *parent)
    : QQuickItem(parent)
{

}

void QDateTimePicker::showPicker()
{
#ifdef Q_OS_IOS
    DatePickerController *datePickerController = [[DatePickerController alloc] initWithDelegate:this];
    [datePickerController showPicker];
#endif
}

QDateTime QDateTimePicker::selectedDate()
{
    return m_selectedDate;
}

void QDateTimePicker::setSelectedDate(QDateTime newDate)
{
    if (m_selectedDate == newDate)
      return;

    m_selectedDate = newDate;
    emit selectedDateChanged();
}

