//
//  ColorButton.h
//  RPCanvas
//
//  Created by Rishil Patel on 29/01/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorButton : UIButton
-(void)setColor_Shadow:(UIColor *)color text:(NSString *)text withSelectedBorder:(BOOL)isSelected;
-(void)setSelectedBorder:(BOOL)isSelected;
@end

NS_ASSUME_NONNULL_END
