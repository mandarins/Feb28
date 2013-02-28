//
//  View.m
//  Feb28
//
//  Created by Salvatore Lentini on 2/27/13.
//  Copyright (c) 2013 Salvatore Lentini. All rights reserved.
//

#import "View.h"

@implementation View
/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    

        
    }
    return self;
}
 */
- (id) initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super initWithCoder: aDecoder];
    if (self) {
        UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"iTunesArtwork.png"]];
        self.backgroundColor = background;
        
    }
    
    return self;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
