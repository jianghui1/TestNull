//
//  ViewController.m
//  TestNull
//
//  Created by ys on 16/8/8.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 4; i++) {
        
        NSString *name = [@"data" stringByAppendingString:[@(i) stringValue]];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSError *error;
        id response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            NSLog(@"%@", response);
        }
        
        if (response == nil) {
            NSLog(@"nil");
        }
        
        if ([response isKindOfClass:[NSNull class]]) {
            NSLog(@"nsnull");
        }
        
        if (response == NULL) {
            NSLog(@"NULL");
        }
        
//        if (i == 3) {
//            NSLog(@"%@", [response objectForKey:@"name"]);
//        }
    }
    
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    textField.placeholder = @"请输入名字";
    textField.delegate = self;
    textField.backgroundColor = [UIColor redColor];
    [self.view addSubview:textField];
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length + string.length > 3) {
        return NO;
    }
    return YES;
}

@end
