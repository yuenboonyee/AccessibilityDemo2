//
//  AccessibleGraph.m
//  AccessibilityDemo2
//
//  Created by Serene IT on 11/09/2015.
//  Copyright (c) 2015 Serene IT. All rights reserved.
//

#import "AccessibleGraph.h"

@interface AccessibleGraph()
@property (weak, nonatomic) IBOutlet UIImageView *imgGraph;
@property (weak, nonatomic) IBOutlet UIView *graphSegmentLeft;
@property (weak, nonatomic) IBOutlet UIView *graphSegmentMiddle;
@property (weak, nonatomic) IBOutlet UIView *graphSegmentRight;

@property (nonatomic, strong) NSMutableArray *accessibleElements;
@end

@implementation AccessibleGraph

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Properties
/*!
 @brief  Used as a data source for the UIAccessibilityContainer protocol.
 @discussion Create and configure a UIAccessibilityElement object for each of the elements in our custom view and store them in an array.
 @return An array of UIAccessibleElements.
 */
- (NSMutableArray *)accessibleElements
{
    if (_accessibleElements != nil)
    {
        return _accessibleElements;
    }
    
    _accessibleElements = [[NSMutableArray alloc] init];
    
    //Create accessible elements for each slice of the graph.
    [_accessibleElements addObject:[self createAccessibilityElementForGraphSegmentView:self.graphSegmentLeft
                                                                             withLabel:@"Steve Jobs unveils first iPhone. No dramatic surge in Apple share price until about 1 year later."]];

    [_accessibleElements addObject:[self createAccessibilityElementForGraphSegmentView:self.graphSegmentMiddle
                                                                             withLabel:@"Share price goes up and down for no apparent reason."]];

    [_accessibleElements addObject:[self createAccessibilityElementForGraphSegmentView:self.graphSegmentRight
                                                                             withLabel:@"Share price goes nuts."]];
    return _accessibleElements;
}

/*!
 @brief  Creates an UIAccessibilityElement.
 @param view								The graph segment UIView.
 @param accessibilityLabel	The accessibility label.
 @return A UIAccessibilityElement.
 */
-(UIAccessibilityElement *)createAccessibilityElementForGraphSegmentView: (UIView *)view
                                                   withLabel:(NSString *)accessibilityLabel{
    UIAccessibilityElement *accessibilityElement = [[UIAccessibilityElement alloc] initWithAccessibilityContainer:self];
    accessibilityElement.accessibilityFrame = [self convertRect:view.frame
                                                      toView:nil];
    accessibilityElement.accessibilityLabel = NSLocalizedString(accessibilityLabel, nil);
    accessibilityElement.accessibilityTraits = UIAccessibilityTraitStaticText;
    return accessibilityElement;
}

#pragma mark - UIAccessibilityProtocol conformance
- (NSInteger)accessibilityElementCount
{
    return [[self accessibleElements] count];
}

- (id)accessibilityElementAtIndex:(NSInteger)index
{
    return [[self accessibleElements] objectAtIndex:index];
}

- (NSInteger)indexOfAccessibilityElement:(id)element
{
    return [[self accessibleElements] indexOfObject:element];
}

@end
