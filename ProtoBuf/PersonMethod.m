//
//  PersonMethod.m
//  ProtoBuf
//
//  Created by clf on 2018/3/13.
//  Copyright © 2018年 com.clf. All rights reserved.
//

#import "PersonMethod.h"
#import <ProtocolBuffers/ProtocolBuffers.h>
#import "Person.pb.h"

@implementation PersonMethod

+ (void)post

{
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.timeoutInterval = 0.5;
    
    request.HTTPMethod = @"GET";
    
    // 设置请求体
    LoginRequestBuilder *builder = [LoginRequest builder];
//    PdClickInfoBuilder *builder = [PdClickInfo builder];
    
    NSString *type = [NSString stringWithFormat:@"1"];
    NSString *nameStr = [NSString stringWithFormat:@"13714181323"];
    NSString *pwdStr = [NSString stringWithFormat:@"111111"];

    builder.type = [type dataUsingEncoding:NSUTF8StringEncoding];
    builder.username = [nameStr dataUsingEncoding:NSUTF8StringEncoding];
    builder.password = [pwdStr dataUsingEncoding:NSUTF8StringEncoding];
    
    LoginRequest *req = [builder build];
    NSLog(@"data = %@",[req data]);

    request.HTTPBody = [req data];


    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error){

            NSLog(@"error = %@",error);

        }

        else{

//            NSLog(@"------ data = %@",data);

            NSLog(@"success");

            // 返回的数据

            NSString *result = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];

            NSLog(@"%@",result);

        }

    }];

    [task resume];

}
    
- (void)get

{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.baidu.com"]];

    LoginResponse *response = [[LoginResponse alloc]init];

    response = [LoginResponse parseFromData:data];

    NSLog(@"%@",response);

    NSLog(@"%@", [[NSString alloc]initWithData:response.token encoding:NSUTF8StringEncoding]);

}




@end



