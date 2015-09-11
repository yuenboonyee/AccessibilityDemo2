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
 @return <#return value description#>
 */
- (NSMutableArray *)accessibleElements
{
    if (_accessibleElements != nil)
    {
        return _accessibleElements;
    }
    
    _accessibleElements = [[NSMutableArray alloc] init];
    
    //Create accessible elements for each slice of the graph.
    //Left
    UIAccessibilityElement *graphElementLeft = [[UIAccessibilityElement alloc] initWithAccessibilityContainer:self];
    //The accessibility frame must be specified in screen coordinates
    graphElementLeft.accessibilityFrame = [self convertRect:self.graphSegmentLeft.frame
                                                                      toView:nil];
    graphElementLeft.accessibilityLabel = NSLocalizedString(@"Steve Jobs unveils first iPhone. No dramatic surge in Apple share price until about 1 year later.", nil);
    graphElementLeft.accessibilityTraits = UIAccessibilityTraitStaticText;
    [_accessibleElements addObject:graphElementLeft];
    
    //Middle
    UIAccessibilityElement *graphElementMiddle = [[UIAccessibilityElement alloc] initWithAccessibilityContainer:self];
    graphElementMiddle.accessibilityFrame = [self convertRect:self.graphSegmentMiddle.frame
                                                                        toView:nil];
    graphElementMiddle.accessibilityLabel = NSLocalizedString(@"Share price goes up and down for no apparent reason.", nil);
    graphElementMiddle.accessibilityTraits = UIAccessibilityTraitStaticText;
    [_accessibleElements addObject:graphElementMiddle];
    
    //Right
    UIAccessibilityElement *graphElementRight = [[UIAccessibilityElement alloc] initWithAccessibilityContainer:self];
    graphElementRight.accessibilityFrame = [self convertRect:self.graphSegmentRight.frame
                                                                       toView:nil];
    graphElementRight.accessibilityLabel = NSLocalizedString(@"Share price goes nuts.", nil);
    graphElementRight.accessibilityTraits = UIAccessibilityTraitStaticText;
    [_accessibleElements addObject:graphElementRight];
    
    
    
    return _accessibleElements;
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
