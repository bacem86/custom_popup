//
//  test.m
//  BFPopup
//
//  Created by Bacem on 03/03/2015.
//  Copyright (c) 2015 BF. All rights reserved.
//

#import "test.h"

@implementation test
@synthesize dateItem,date;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)testt{
    NSMutableArray* _valideDate;
    for(int i = 0;i<[_valideDate count];i++)
    {
        for(int j= 0;j<[self.NoteDateValide count];j++)
        {
            if(([[self.dateFormatter stringFromDate:[_valideDate objectAtIndex:i]] isEqual:[self.dateFormatter stringFromDate:date]])&&([[self.NoteDateValide objectAtIndex:j] isEqualToString:@"4.00"]))
            {
                dateItem.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gallery_init.png"]];
                dateItem.textColor = [UIColor whiteColor];
                
            }
            else if(([[self.dateFormatter stringFromDate:[_valideDate objectAtIndex:i]] isEqual:[self.dateFormatter stringFromDate:date]])&&([[self.NoteDateValide objectAtIndex:j] isEqualToString:@"14.00"]))
            {
                dateItem.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"video_init.png"]];
                dateItem.textColor = [UIColor whiteColor];
                
            }
            else if(([[self.dateFormatter stringFromDate:[_valideDate objectAtIndex:i]] isEqual:[self.dateFormatter stringFromDate:date]])&&([[self.NoteDateValide objectAtIndex:j] isEqualToString:@"18.00"]))
            {
                dateItem.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_calendrier_supporter.png"]];
                dateItem.textColor = [UIColor whiteColor];
                
            }
            else if(([[self.dateFormatter stringFromDate:[_valideDate objectAtIndex:i]] isEqual:[self.dateFormatter stringFromDate:date]])&&([[self.NoteDateValide objectAtIndex:j] isEqualToString:@"15.00"]))
            {
                dateItem.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gallery_clicked.png"]];
                dateItem.textColor = [UIColor whiteColor];
            }
        }
    }

}
@end
