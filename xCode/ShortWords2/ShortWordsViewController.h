//
//  ShortWordsViewController.h
//  ShortWords2
//
//  Created by Poindexter, Miles on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShortWordsBrain.h"

@interface ShortWordsViewController : UIViewController <UITextFieldDelegate>  {

  ShortWordsBrain *brain;
  IBOutlet UITextField *txtEntry;
  IBOutlet UITextView *lookup;

}

@property (retain) IBOutlet UITextField *txtEntry;
@property (retain) IBOutlet UITextView *lookup;

- (void)lookupPressed:(NSString *)word;

@end
