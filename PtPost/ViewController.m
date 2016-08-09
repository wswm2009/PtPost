//
//  ViewController.m
//  DMNetworking
//
//  Created by Vito on 3/1/16.
//  Copyright © 2016 Vito. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "NSData-MD5.h"
#import <CommonCrypto/CommonDigest.h>
#import "UIImage-Resize.h"
#import "YYHelper.h"
@interface ViewController ()

@property(nonatomic, strong) NSOperationQueue *upLoadQueue;

@end






@implementation ViewController

- (instancetype)init
{
	self = [super init];
	if (self) {

	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}




-(void) SavePostHairMaskPic:(NSString *)fileDir arg2:(NSString *)fileName arg3:(void(^)(void)) completion
{
    
    @autoreleasepool {
        
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSString *path=[NSString stringWithFormat:@"%@%@",fileDir,fileName];
        UIImage  *myImage=[UIImage imageWithContentsOfFile:path];
        UIImage *newImage=[myImage resizeImageWithMaxSize:CGSizeMake( 321,321)];
        NSData *imageData = UIImageJPEGRepresentation(newImage,  1.0);
        myImage=nil;
        NSString *str=[imageData base64EncodedStringWithOptions:0];
        imageData=nil;
        NSMutableDictionary *dic=[NSMutableDictionary dictionary];
        [dic setObject:@"1" forKeyedSubscript:@"type"];
        [dic setObject:str  forKeyedSubscript:@"photo_data"];
        NSMutableData *data2=[NSMutableData dataWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
        NSString *str2=[NSString stringWithFormat:@"%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",0x72, 0x44,0x7A, 0x6F,0x69,0x65,0x35, 0x65,0x33, 0x6F, 0x6E,0x67, 0x66, 0x7A,0x31,0x6C];
        [data2 appendData:[str2 dataUsingEncoding:NSUTF8StringEncoding]];
        NSString *strMD5Key=[data2 MD5String];
        [dic setObject:strMD5Key forKeyedSubscript:@"key"];
        
        // 设置请求格式
        manager.requestSerializer = [AFHTTPRequestSerializer serializer ];
        // 设置返回格式
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
        
        
        [manager POST:@"http://tu.qq.com/cgi/doHairMask.php" parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *dic2 = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            NSString *result=  [dic2 objectForKey:@"photo_data"];
            if ([result isKindOfClass:[NSString class]])
            {
                NSData *photoData=[[NSData alloc]initWithBase64EncodedString:result options:0];
                NSString *DesDirPath = [NSString stringWithFormat:@"%@/Documents/DesPic/%@", NSHomeDirectory(),fileName];
                [photoData writeToFile:DesDirPath atomically:YES];
                [photoData release];
           
            }
            if (completion) {
                completion();
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (completion) {
                completion();
            }
            
        }];
    }
}


-(void) LoopSavePostHairMaskPic: (NSMutableArray *)files arg2:(NSString *)fileDir
{
    if (files.count == 0) {
        UIAlertView* alertview=[[UIAlertView alloc]initWithTitle:@"处理" message:@"处理完成" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertview show];
        [alertview release];
    } else {
        [YYHelper YYLog:fileDir,[NSString stringWithFormat:@"%d  %@",[files count],[files lastObject]],nil];
        [self SavePostHairMaskPic:fileDir arg2:[files lastObject] arg3:^(){
            [files removeLastObject];
            [self LoopSavePostHairMaskPic:files arg2:fileDir];
         }];
    }
    
}

-(void) PostPic11
{
    
    NSFileManager *fileManager=[[[NSFileManager alloc] init]autorelease];
    NSString *homeStr=NSHomeDirectory();
    NSString* documentDir =[NSString stringWithFormat:@"%@/Documents/SrcPic/GroupSrc11/",homeStr];
    NSError *error = nil;
    NSMutableArray *fileList  = [[[fileManager contentsOfDirectoryAtPath:documentDir error:&error] mutableCopy]autorelease] ;

    // NSMutableArray *fileList  = [[YYHelper getFilenamelistOfType:@"jpg" fromDirPath:documentDir] mutableCopy] ;
    [self LoopSavePostHairMaskPic:fileList arg2:documentDir];
    
    
    
}
-(void) PostPic22
{
    
    NSFileManager *fileManager=[[[NSFileManager alloc] init]autorelease];
    NSString *homeStr=NSHomeDirectory();
    NSString* documentDir =[NSString stringWithFormat:@"%@/Documents/SrcPic/GroupSrc22/",homeStr];
    NSError *error = nil;
    NSMutableArray *fileList  = [[[fileManager contentsOfDirectoryAtPath:documentDir error:&error] mutableCopy]autorelease] ;
    
    // NSMutableArray *fileList  = [[YYHelper getFilenamelistOfType:@"jpg" fromDirPath:documentDir] mutableCopy] ;
    [self LoopSavePostHairMaskPic:fileList arg2:documentDir];
    
    
    
}
-(void) PostPic33
{
    
    NSFileManager *fileManager=[[[NSFileManager alloc] init]autorelease];
    NSString *homeStr=NSHomeDirectory();
    NSString* documentDir =[NSString stringWithFormat:@"%@/Documents/SrcPic/GroupSrc33/",homeStr];
    NSError *error = nil;
    NSMutableArray *fileList  = [[[fileManager contentsOfDirectoryAtPath:documentDir error:&error] mutableCopy]autorelease] ;
    
    // NSMutableArray *fileList  = [[YYHelper getFilenamelistOfType:@"jpg" fromDirPath:documentDir] mutableCopy] ;
    [self LoopSavePostHairMaskPic:fileList arg2:documentDir];
   
    
    
}
-(void) PostPic44
{
    
    NSFileManager *fileManager=[[[NSFileManager alloc] init]autorelease];
    NSString *homeStr=NSHomeDirectory();
    NSString* documentDir =[NSString stringWithFormat:@"%@/Documents/SrcPic/GroupSrc44/",homeStr];
    NSError *error = nil;
    NSMutableArray *fileList  = [[[fileManager contentsOfDirectoryAtPath:documentDir error:&error] mutableCopy]autorelease] ;
    
    // NSMutableArray *fileList  = [[YYHelper getFilenamelistOfType:@"jpg" fromDirPath:documentDir] mutableCopy] ;
    [self LoopSavePostHairMaskPic:fileList arg2:documentDir];

    
    
}
-(void) PostPic55
{
    
    NSFileManager *fileManager=[[[NSFileManager alloc] init]autorelease];
    NSString *homeStr=NSHomeDirectory();
    NSString* documentDir =[NSString stringWithFormat:@"%@/Documents/SrcPic/GroupSrc55/",homeStr];
    NSError *error = nil;
    NSMutableArray *fileList  = [[[fileManager contentsOfDirectoryAtPath:documentDir error:&error] mutableCopy]autorelease] ;
    
    // NSMutableArray *fileList  = [[YYHelper getFilenamelistOfType:@"jpg" fromDirPath:documentDir] mutableCopy] ;
    [self LoopSavePostHairMaskPic:fileList arg2:documentDir];

    
    
}
-(void) PostPic66
{
    NSFileManager *fileManager=[[[NSFileManager alloc] init]autorelease];
    NSString *homeStr=NSHomeDirectory();
    NSString* documentDir =[NSString stringWithFormat:@"%@/Documents/SrcPic/GroupSrc66/",homeStr];
    NSError *error = nil;
    NSMutableArray *fileList  = [[[fileManager contentsOfDirectoryAtPath:documentDir error:&error] mutableCopy]autorelease] ;
    
    // NSMutableArray *fileList  = [[YYHelper getFilenamelistOfType:@"jpg" fromDirPath:documentDir] mutableCopy] ;
    [self LoopSavePostHairMaskPic:fileList arg2:documentDir];

    
    
}
-(void) PostPic77
{
    
    NSFileManager *fileManager=[[[NSFileManager alloc] init]autorelease];
    NSString *homeStr=NSHomeDirectory();
    NSString* documentDir =[NSString stringWithFormat:@"%@/Documents/SrcPic/GroupSrc77/",homeStr];
    NSError *error = nil;
    NSMutableArray *fileList  = [[[fileManager contentsOfDirectoryAtPath:documentDir error:&error] mutableCopy]autorelease] ;
    
    // NSMutableArray *fileList  = [[YYHelper getFilenamelistOfType:@"jpg" fromDirPath:documentDir] mutableCopy] ;
    [self LoopSavePostHairMaskPic:fileList arg2:documentDir];

    
    
}
-(void) PostPic88
{
    
    NSFileManager *fileManager=[[[NSFileManager alloc] init]autorelease];
    NSString *homeStr=NSHomeDirectory();
    NSString* documentDir =[NSString stringWithFormat:@"%@/Documents/SrcPic/GroupSrc88/",homeStr];
    NSError *error = nil;
    NSMutableArray *fileList  = [[[fileManager contentsOfDirectoryAtPath:documentDir error:&error] mutableCopy]autorelease] ;
    
    // NSMutableArray *fileList  = [[YYHelper getFilenamelistOfType:@"jpg" fromDirPath:documentDir] mutableCopy] ;
    [self LoopSavePostHairMaskPic:fileList arg2:documentDir];

    
    
}
-(void) PostPic99
{
    
    NSFileManager *fileManager=[[[NSFileManager alloc] init]autorelease];
    NSString *homeStr=NSHomeDirectory();
    NSString* documentDir =[NSString stringWithFormat:@"%@/Documents/SrcPic/GroupSrc99/",homeStr];
    NSError *error = nil;
    NSMutableArray *fileList  = [[[fileManager contentsOfDirectoryAtPath:documentDir error:&error] mutableCopy]autorelease] ;
    
    // NSMutableArray *fileList  = [[YYHelper getFilenamelistOfType:@"jpg" fromDirPath:documentDir] mutableCopy] ;
    [self LoopSavePostHairMaskPic:fileList arg2:documentDir];

}
-(IBAction)PtPostPic :(id)sender
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self PostPic11];
    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self PostPic22];
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self PostPic33];
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self PostPic44];
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self PostPic55];
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self PostPic66];
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self PostPic77];
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self PostPic88];
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self PostPic99];
//    });
    
}

@end



