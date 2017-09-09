////////////////////////////////////////////////////////////////////////
// SKWRoomDataMessage.h
// SkyWay SDK
////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>

//! \~japanese  ルームで受信するデータメッセージです
//! \~english
//! \~
@interface SKWRoomDataMessage : NSObject < NSCopying >

//! \~japanese  送信者のピア ID
//! \~english
//! \~
@property (nonatomic, readonly) NSString* src;

//! \~japanese  受信したデータ
//! \~english
//! \~
@property (nonatomic, readonly) NSObject* data;

@end
