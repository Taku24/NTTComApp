////////////////////////////////////////////////////////////////////////
//  SKWPeerCredential.h
//  SkyWay SDK
////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>

@interface SKWPeerCredential : NSObject

@property (nonatomic) NSUInteger timestamp;

@property (nonatomic) NSUInteger ttl;

@property (nonatomic, copy) NSString* authToken;

@end
