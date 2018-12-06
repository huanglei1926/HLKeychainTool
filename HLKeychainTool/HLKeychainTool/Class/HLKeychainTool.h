//
//  HLKeychainTool.h
//  HLKeychainTool
//
//  Created by Len on 2018/12/6.
//  Copyright © 2018 HLKeychainTool. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HLKeychainTool : NSObject


/**
 获取唯一设备标识(将BundleId的MD5作为Key,IDFV作为Value存储到钥匙串中,如果想要)
 */
+ (NSString *)getDeviceIdentifierString;

@end

NS_ASSUME_NONNULL_END
