//
//  ShortWordsBrain.m
//  ShortWords2
//
//  Created by Poindexter, Miles on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShortWordsBrain.h"


@implementation ShortWordsBrain

- (NSString *)performLookup:(NSString *)word {
	NSLog(@"performLookup gets: %@", word);
	
    // Start request
    NSString *lookupURL = [@"http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=" stringByAppendingString:word];
	
    NSURL *url = [NSURL URLWithString:lookupURL];
	//ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	
	//[request setDelegate:del];
    //[request startAsynchronous];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
                                                cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                            timeoutInterval:30];
    // Fetch the JSON response
    NSData *urlData;
    NSURLResponse *response;
    NSError *error;
    
    // Make synchronous request
    urlData = [NSURLConnection sendSynchronousRequest:urlRequest
                                    returningResponse:&response
                                                error:&error]; 
    //[self performAsyncLookup:urlRequest];
    //[NSURLConnection connectionWithRequest:urlRequest delegate:self];
    //[urlRequest release];

    
    // Construct a String around the Data from the response
    return [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
    //return [[NSString alloc] initWithData:self.urlData encoding:NSUTF8StringEncoding];
    
	
}

/*
- (void) performAsyncLookupOLD:(NSURLRequest *)urlRequest {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSLog(@"performAsyncLookup gets: %@", urlRequest);
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        if ([data length] > 0 && error == nil)
            [self receivedData:data];
        //else if ([data length] == 0 && error == nil)
        //    [self emptyReply];
        //else if (error != nil && error.code == ERROR_CODE_TIMEOUT)
        //    [self timedOut];
        //else if (error != nil)
        //    [self downloadError:error];
    }];
}
*/

@end
