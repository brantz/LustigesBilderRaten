//
//  ReverseImageSearch.h
//  Lustiges Bilderraten
//
//  Created by Thomas Rudolf on 20/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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


#import <Foundation/Foundation.h>

@interface ReverseImageSearch : NSObject

-(NSString *)getInfoOnImage: (UIImage *) selectedImage;

@end
