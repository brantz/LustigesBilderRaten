//
//  ReverseImageSearch.m
//  Lustiges Bilderraten
//
//  Created by Thomas Rudolf on 20/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//
//	Sadly Google doesnt provide an API for it's otherwise really awesome
//	Reverse Image Search. So the request has to be done directly to Google's
//	Web Interface. Since Objective C doesnt provide any HTTP Post request 
//	method, that allows suitable configuration to do this, the request is 
//	first sent to a server that redirects that request to Google. The response
//	then is parsed and analyzed using Selenium in a headless instance of 
//	Mozilla's Firefox. This has to be done because the Google's response
//	contains AJAX elements that can't be parsed in plain static HMTL. The 
//	parsed output is then sent back to this App.

#import "ReverseImageSearch.h"

@implementation ReverseImageSearch

- (NSString *) getInfoOnImage:(UIImage *) selectedImage {
	
	NSData *imageData = UIImageJPEGRepresentation(selectedImage, 0.5	);
	
	NSString *urlString = [NSString stringWithFormat:@"http://3141.eu:4567"];
	
	NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	
	[request setURL:[NSURL URLWithString:urlString]];
	[request setHTTPMethod:@"POST"];
	
	//set headers
	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
	[request addValue:contentType forHTTPHeaderField: @"Content-Type"];
	
	//create the body
	NSMutableData *postBody = [NSMutableData data];
	
	[postBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"file\"; filename=\"9633_865-h.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithString:@"Content-Type: image/jpeg\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[postBody appendData:[NSData dataWithData:imageData]];
	[postBody appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	
	// close form
    [postBody appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	
	//post
	[request setHTTPBody:postBody];
	
	//get response
	NSHTTPURLResponse* urlResponse = nil;  
	NSError *error = [[NSError alloc] init];  
	NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];  
	NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	NSLog(@"Response Code: %d", [urlResponse statusCode]);
	if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300) {
		NSLog(@"Response: %@", result);
	}
	
	return result;
}

@end
