# HLKeychainTool
使用Keychain保存并获取唯一DeviceIdentifier

使用SFHFKeychainUtils进行keychain操作
```Objective-C
#define APPBundleIdentifier [[NSBundle mainBundle] bundleIdentifier]

+ (NSString *)getDeviceIdentifierString{
    NSString *uuidString = [self getUUIDStringFromKeyChain];
    if (!uuidString || !uuidString.length) {
        uuidString = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        if (uuidString && uuidString.length) {
            [self saveUUIDStringToKeyChain:uuidString];
        }
    }
    return uuidString;
}

+ (NSString *)getUUIDStringFromKeyChain{
    return [SFHFKeychainUtils getPasswordForUsername:@"AppDeviceIdentifier" andServiceName:[self getMD5StringFrom:APPBundleIdentifier] error:nil];
}


+ (BOOL)saveUUIDStringToKeyChain:(NSString *)uuidString{
    return [SFHFKeychainUtils storeUsername:@"AppDeviceIdentifier" andPassword:uuidString forServiceName:[self getMD5StringFrom:APPBundleIdentifier] updateExisting:NO error:nil];
}

+ (NSString *)getMD5StringFrom:(NSString *)string {
    const char *cStr = [string UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (unsigned int) strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

```
