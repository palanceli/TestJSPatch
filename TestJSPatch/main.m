//
//  main.m
//  TestJSPatch
//
//  Created by palance on 15/11/12.
//  Copyright © 2015年 binglen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JPEngine.h"
#import "TestObj.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        if (argc != 3) {
            NSLog(@"usage: testJP [JSPatch.js path] [replace js path]");
            return -1;
        }
        NSString *jsPatchPath = [NSString stringWithUTF8String:argv[1]];
        NSString *replaceJSPath = [NSString stringWithUTF8String:argv[2]];
        
        [JPEngine startEngine:jsPatchPath];
        NSString *script = [NSString stringWithContentsOfFile:replaceJSPath encoding:NSUTF8StringEncoding error:nil];
        [JPEngine evaluateScript:script];
        
        TestObj *obj = [[TestObj alloc]init];
        [obj mainProc];
    }
    return 0;
}
