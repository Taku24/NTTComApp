////////////////////////////////////////////////////////////////////////
// SKWSFURoom.h
// SkyWay SDK
////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>
#import "SKWRoom.h"

@class SKWMediaStream;
@class SKWRoomOption;

//! \~japanese SFU ルームクラス
//! \~english
//! \~
//!
//! \~japanese
//! ピアとのメディア通信にひとつのメディア接続とデータ通信に Socket.io でデータ接続を確立したルームです。
//! \~english
//! \~
@interface SKWSFURoom : SKWRoom

//! \~japanese 現在のルームから退室します
//! \~english
//! \~
- (void)close;

//! \~japanese
//! 送信しているメディアストリームを更新します。
//! 受信のみモードから双方向に切り替えることも出来ます。
//! \~english
//! \~
//!
//! \code{.m}
//! SKWSFURoom* room;
//! SKWMediaStream* stream;
//!
//! [room replaceStream:stream];
//!
//! \endcode
//!
//! @param newStream
//! \~japanese ルーム内のユーザに送るメディアストリーム
//! \~english
//! \~
- (void)replaceStream:(SKWMediaStream* __nullable)newStream;

@end
