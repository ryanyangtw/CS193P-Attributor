//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Ryan on 2015/1/26.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;

@end

@implementation TextStatsViewController


// For test
/*
- (void)viewDidLoad {
    [super viewDidLoad];
    self.textToAnalyze = [[NSAttributedString alloc] initWithString:@"test" attributes:@{NSForegroundColorAttributeName : [UIColor greenColor], NSStrokeWidthAttributeName : @-3}];

}
*/


- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze
{

    _textToAnalyze = textToAnalyze;
    if (self.view.window) [self updateUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}


- (NSAttributedString *)charactersWithAttribute:(NSString *)attributeName
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    
    //int
    long index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range] ];
            index = range.location + range.length;
        } else {
            index++;
        }
    }
    
    return characters;

}


- (void)updateUI
{

    
//    NSLog(@"test class is: %@", [[self charactersWithAttribute:NSForegroundColorAttributeName] class]);
//    NSRange range;
//    range.length = 3;
//    range.location = 0;
//    id test = [self charactersWithAttribute:NSForegroundColorAttributeName];
//    [test fixAttributesInRange:range];
    
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%lu colorful characters", [[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%lu colorful characters", [[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
    
}

@end
