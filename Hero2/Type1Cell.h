//
//  Type1Cell.h
//  StarWars
//
//  Created by Tom Williamson on 5/4/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Type1Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView* image;
@property (weak, nonatomic) IBOutlet UILabel* name;
@property (weak, nonatomic) IBOutlet UILabel* desc;

@end
