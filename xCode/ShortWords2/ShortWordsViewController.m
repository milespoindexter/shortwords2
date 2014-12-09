//
//  ShortWordsViewController.m
//  ShortWords2
//
//  Created by Poindexter, Miles on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShortWordsViewController.h"
#import "SBJson.h"

@interface ShortWordsViewController ()

@end

@implementation ShortWordsViewController 

@synthesize txtEntry, lookup;

- (ShortWordsBrain *)brain {
	if(!brain) {
		brain = [[ShortWordsBrain alloc] init];
	}
	NSLog(@"brain created");
	return brain;
}


- (void)lookupPressed:(NSString *)word {
	//get results from brain.
	NSLog(@"text entry: %@", word);
    NSString *response = nil;
	
	NSString *resp = [[self brain]performLookup:word];	
            
    NSArray *responseArray = [resp JSONValue];
    //NSLog(@"response class = %@",[responseArray class]);
    
    if(responseArray) {
        NSDictionary *responseDict = [responseArray lastObject];
        if(responseDict) {
            //NSLog(@"response dictionary found . . .");
            
            id lfsArray = [responseDict objectForKey:@"lfs"];
            if(lfsArray) {
                //NSLog(@"array found for lfs");
                //NSLog(@"lfs class = %@",[lfsArray class]);
                //NSLog(@"count: %@",[NSString stringWithFormat:@"%g", [lfsArray count]]);
                response = response = [NSString stringWithFormat:@"RESULTS FOR %@%@", word, @":\r"];
                for(NSDictionary * dict in lfsArray) {
                    //NSLog(@"dict class = %@",[dict class]);
                    if(dict) {
                        
                        NSString *lf =  [dict objectForKey:@"lf"];
                        //NSLog(@"lf = %@",lf);
                        if(response) {
                            response = [response stringByAppendingString:lf];
                            
                        }
                        else {
                            response = lf;
                        }
                        response = [response stringByAppendingString:@"\r"];
                        //NSLog(@"response = %@",response);
                    }
                }
            }
        }
        if(!response) {
            response = [NSString stringWithFormat:@"nothing found for %@", word];
        }
    }
    else {
        response = resp;
        
    }
        
    [self.lookup setText:response];
    [self.txtEntry setText:@""];
}




- (void)viewDidLoad {
	self.txtEntry.delegate = self;
	//disable text entry to lookup result textview
	self.lookup.editable = NO;
	//disable auto-correction on txt entry UITextField
	self.txtEntry.autocorrectionType = UITextAutocorrectionTypeNo;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.txtEntry.text = nil;
	[self.txtEntry becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)txtField {
	if(txtField.text.length) {
		NSString *word = txtField.text;
		[self lookupPressed:word];
		[txtField resignFirstResponder];
		return YES;
	}
	return NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	NSLog(@"text entry: %@", textField.text);
	
}

- (void)viewDidUnload {
	[super viewDidUnload];
	self.txtEntry = nil;
	self.lookup = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
